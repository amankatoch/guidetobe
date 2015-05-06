class Review < ActiveRecord::Base
  require 'obscenity/active_model'
  make_flaggable

  after_save :update_supplier_rating
  after_create :notify_owner_and_bride, :send_welcome_first_review, :delete_bride_weekly_remider_after_three_reviews
  
  Obscenity.replacement(:garbled).sanitize('shite')
  validates :general_content, presence: true, length: { in: 50..350 }, obscenity: { sanitize: true, replacement: '****'}
  validates :like_content, obscenity: { sanitize: true, replacement: '****'}
  validates :unlike_content, obscenity: { sanitize: true, replacement: '****'}
  validates_length_of :like_content, :maximum => 140, :message => 'Things you liked should be a maximum of 100 characters'
  validates_length_of :unlike_content, :maximum => 140, :message => "Things you didn't like should be a maximum of 100 characters"
  validates :service, presence: true
  validates :price, presence: true
  validates :overall, presence: true
  validates :supplier_id, presence: true
  validates :bride_id, presence: true, numericality: true
  validates_acceptance_of :terms, allow_nil: false, on: :create

  belongs_to :supplier, counter_cache: true
  belongs_to :bride
  has_many :reports, dependent: :destroy
  has_many :replies

  delegate :name, to: :supplier, prefix: true
  delegate :name, to: :bride, prefix: true

  def has_images?
    true if self.image_one_url? || self.image_two_url? || self.image_three_url?
  end

  def self.recent
    order('created_at DESC').limit(4)
  end

  def self.reported
    reported_reviews = []
    self.all.each { |r| reported_reviews << r if r.reports.count > 0}
    reported_reviews
  end

  def self.order_by_date
    order('created_at DESC')
  end

  def self.visible
    where(hidden: false)
  end

  def no_reply?
    true if self.first_reply == nil
  end

  def has_reply?
    true if self.first_reply != nil
  end

  def first_reply
    replies.first
  end

  def reported?
    true if reports.count > 0
  end

  def report_explanation
    "This review has been reported #{self.reports.count} times"
  end

  def author
    bride.username
  end

  def update_supplier_rating
    self.supplier.update_rating
  end

  def notify_owner_and_bride
    OwnerMailer.new_review(self, supplier.owner).deliver if supplier.owned?
    BrideMailer.new_review(self.bride).deliver
    if supplier.owned?
      OwnerMailer.new_review_for_supplier_with_owner(self, supplier).deliver
    else
      OwnerMailer.new_review_for_supplier_without_owner(self, supplier).deliver
    end
  end

  def first_review?
    true if self.bride.reviews.count == 1
  end

  def send_welcome_first_review
    BrideMailer.first_review(self.bride).deliver if first_review?
  end

  # delete the record from delayed job if the bride reaches out to three reviews before week
  def delete_bride_weekly_remider_after_three_reviews
    Delayed::Job.find_by_id(bride.weekly_reminder_id).destroy rescue nil if self.bride.reviews.count == 3
  end    

  def self.for_region_and_category(region, category)
    suppliers = Supplier.for_region_and_category(region, category)
    Review.where(supplier_id: suppliers_ids)
  end

end
