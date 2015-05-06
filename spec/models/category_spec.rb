require 'spec_helper'

describe Category do
  it { should validate_presence_of :name }

  it do
    create(:category)
    validate_uniqueness_of :name
  end

  it { should have_many :suppliers }
  it { should have_many(:reviews).through(:suppliers) }
  it { should have_many :advertisements }

  it "returns a supplier count for an instance with a region" do
    region = create(:region)
    category = create(:category)
    suppliers = create_list(:supplier, 3, region: region, category: category)
    category.supplier_count_for_region(region).should eq 3
  end

end
