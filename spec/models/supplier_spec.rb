require 'spec_helper'

describe Supplier do

  it { should validate_presence_of :name }
  it do
    create(:supplier)
    validate_uniqueness_of :supplier
  end
  it { should validate_presence_of :region_id }
  it { should validate_numericality_of :region_id }
  it { should validate_presence_of :category_id }
  it { should validate_numericality_of :category_id }
  it { should ensure_length_of(:description).is_at_most(300)}

  it { should belong_to :region }
  it { should belong_to :category }
  it { should have_many :reviews }
  it { should have_one :owner }

  it 'should add http to urls if not there already' do
    supplier = create(:supplier, website: 'www.podmedics.com')
    expect(Supplier.first.website).to eq 'http://www.podmedics.com'
  end

  it 'requires at least one of phone number, email or website to validate' do
    supplier = build(:supplier, website: nil, phone: nil, email: nil)
    expect(supplier).to_not be_valid
  end

  it 'should have factory for a :claimed_supplier' do
    supplier = create(:claimed_supplier)
    expect(supplier).to be_valid
  end

  it 'returns the review count' do
    supplier = create(:supplier)
    create_list(:review, 5, supplier: supplier)
    expect(supplier.review_count).to eq 5
  end

  it 'has class method #for_region_and_category' do
    london = create(:region, name: 'London')
    glasgow = create(:region, name: 'Glasgow')
    category = create(:category, name: 'Flowers')
    london_supplier = create(:supplier, region: london, category: category)
    create(:supplier, region: glasgow, category: category)
    expect(Supplier.for_region_and_category(london, category)).to eq [london_supplier]
  end

  it 'has a rank for region and category' do
    region = create(:region)
    category = create(:category)
    top_supplier = create(:supplier, region: region, category: category)
    create(:review, supplier: top_supplier, overall: 5)
    bottom_supplier = create(:supplier, region: region, category: category)
    create(:review, supplier: bottom_supplier, overall: 1)
    top_supplier.rank.should eq 0
  end

  it 'responds to #category_name' do
    category = create(:category)
    supplier = create(:supplier, category: category)
    expect(supplier.category_name).to eq category.name
  end

  it 'responds to #region_name' do
    region = create(:region)
    supplier = create(:supplier, region: region)
    expect(supplier.region_name).to eq region.name
  end

  it 'updates average rating when review created' do
    supplier = create(:supplier)
    create(:review, supplier: supplier, overall: 5)
    expect(supplier.rating).to eq 5
  end

  it 'says whether it is owned' do
    supplier = create(:supplier)
    create(:owner, supplier: supplier)
    expect(supplier.owned?).to be_true
  end

  it 'has a scope method #without_owner to retrieve non claimed suppliers' do
    owned_supplier = create(:supplier)
    create(:owner, supplier: owned_supplier)
    free_supplier_1 = create(:supplier)
    free_supplier_2 = create(:supplier)

    available_supplier = Supplier.without_owner
    expect(available_supplier).to eq [free_supplier_1, free_supplier_2]
  end

  it 'has a scope method #with_owner to retrieve claim suppliers' do
    owned_supplier = create(:supplier)
    create(:owner, supplier: owned_supplier)
    create(:supplier)
    create(:supplier)

    expect(Supplier.with_owner).to eq [owned_supplier]
  end

end
