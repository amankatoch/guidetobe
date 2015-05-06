class Supplier < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :region_id, presence: true, numericality: true
  validates :category_id, presence: true, numericality: true
  validates_length_of :description, maximum: 300

  validates :name, :uniqueness => {:scope => [:region_id, :category_id]}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :website, :with => /((?:https?\:\/\/|www\.)(?:[-a-z0-9]+\.)*[-a-z0-9]+.*)/i

  validate :basic_info?
#  validate :name_category_and_region
  before_save :smart_add_url_protocol

  belongs_to :region
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_one :owner, dependent: :destroy

  accepts_nested_attributes_for :owner, allow_destroy: true

  delegate :name, to: :category, prefix: true
  delegate :name, to: :region, prefix: true



  def youtube_code
    if self.video_url
      if (self.video_url.include? "=") then
        return self.video_url.split('=').last
      else
        return self.video_url.split('/').last
      end
    end
  end

  def has_images?
    true if self.image_one_url? || self.image_two_url? || self.image_three_url? || self.image_four_url?
  end

  def has_video?
    true if self.video_url?
  end

  def basic_info?
    if %w(website email phone).all? { |attr| self[attr].blank? }
      errors.add :website, 'You must fill out at least one of website, email or phone'
      errors.add :email, 'You must fill out at least one of website, email or phone'
      errors.add :phone, 'You must fill out at least one of website, email or phone'
    end
  end

  def name_category_and_region
    existing_supplier = Supplier.where(name: self.name, category_id: self.category_id, region_id: self.region_id).first

    unless existing_supplier.blank?
      errors.add :name, 'This supplier has already been added'
    end
  end

  def self.without_owner
    includes(:owner).where('owners.supplier_id is null').references(:owner)
  end

  def self.with_owner
    joins(:owner)
  end

  def owned?
    true unless owner.nil?
  end

  def self.order_by_rating
    order('rating DESC NULLS LAST').order('reviews_count DESC')
  end

  def self.for_region_and_category(region, category)
    where(region: region).where(category: category)
  end

  def self.for_category(category)
    where(category: category)
  end

  def rank_as_text
    "Rank #{self.rank + 1}/#{self.category.supplier_count_for_region(self.region)}"
  end

  def rank_as_text_for_category(category)
    "Rank #{self.rank_for_category(category) + 1}/#{self.category.suppliers.count}"
  end

  def review_count
    reviews.count
  end

  # only use visible review to calculate overall rating
  def average_overall_rating
    reviews.visible.average(:overall)
  end

  def rank
    Supplier.for_region_and_category(self.region, self.category).order_by_rating.index(self)
  end

  def rank_for_category(category)
    Supplier.for_category(self.category).order_by_rating.index(self)
  end

  def update_rating
    update_attributes(rating: self.average_overall_rating)
  end

  # Ads
  def self.top_five_for_region(region)
    where(region: region).order('rating DESC').limit(5)
  end

  def self.top_five_for_category(category)
    where(category: category).order('rating DESC').limit(5)
  end

  def self.top_five_outside_of_region(region)
    where.not(region: region).order('rating DESC').limit(5)
  end

  def rank_list(index, total_suppliers)
    "Rank #{index}/#{total_suppliers}"
  end

  def self.import_suppliers(file)
    errors_hash = {}
    mini_hash = {}
    suppliers = []

    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      puts "="*80
      puts i
      puts row.inspect
      puts row["category"]
      puts row["category"].class
      puts "="*80

      category = Category.find_by_name(row["category"].strip)
      region = Region.find_by_name(row["region"].strip)
      supplier = Supplier.new({
                    :name         => row["name"],
                    :category_id  => category && category.id || 1,
                    :region_id    => region && region.id || 1,
                    :website      => row["website"],
                    :email        => row["email"],
                    :phone        => row["phone"]
                  })

      if supplier.valid?
        suppliers << supplier
        false
      else
        supplier.errors.messages.each_pair do |key, value|
          mini_hash[key] = value
        end
        row_number = i.to_s
        errors_hash[row_number] = mini_hash
        mini_hash = {}
      end
    end
    if suppliers.present? && errors_hash.blank?
      Thread.new do
        suppliers.each_with_index do |supplier,index|
          index += 1
          supplier.save
          if supplier.email?
            OwnerMailer.new_supplier_added(supplier.email, supplier.name).deliver
            OwnerMailer.delay(run_at: 7.days.from_now).new_supplier_added_first_week(supplier.email, supplier.name)
            OwnerMailer.delay(run_at: 14.days.from_now).new_supplier_added_second_week(supplier.email, supplier.name)
          end
        end
      end
    end
    errors_hash
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  protected

  # make sure that an http is added to all link
  # website, facebook, twitter, google
  def smart_add_url_protocol
    if self.website?
      unless self.website[/\Ahttp:\/\//] || self.website[/\Ahttps:\/\//]
        self.website = "http://#{self.website}"
      end
    end

    if self.facebook_url?
      unless self.facebook_url[/\Ahttp:\/\//] || self.facebook_url[/\Ahttps:\/\//]
        self.facebook_url = "http://#{self.facebook_url}"
      end
    end

    if self.twitter_url?
      unless self.twitter_url[/\Ahttp:\/\//] || self.twitter_url[/\Ahttps:\/\//]
        self.twitter_url = "http://#{self.twitter_url}"
      end
    end

    if self.google_url?
      unless self.google_url[/\Ahttp:\/\//] || self.google_url[/\Ahttps:\/\//]
        self.google_url= "http://#{self.google_url}"
      end
    end
  end

end
