require 'spec_helper'

describe Review do

  it "has a valid factory" do
    review = create(:review)
    expect(review).to be_valid
  end

  it { should validate_presence_of :general_content }
  it { should ensure_length_of(:general_content).is_at_least(50).is_at_most(350)}
  it do
    should ensure_length_of(:like_content).is_at_most(140).with_long_message('Things you liked should be a maximum of 100 characters')
  end
  it do
    should ensure_length_of(:unlike_content).is_at_most(140).with_long_message("Things you didn't like should be a maximum of 100 characters")
  end
  it { should validate_presence_of :service }
  it { should validate_presence_of :price }
  it { should validate_presence_of :overall }
  it { should validate_presence_of :supplier_id }
  it { should validate_presence_of :bride_id }
  it { should validate_numericality_of :bride_id }

  it { should belong_to :supplier }
  it { should belong_to :bride }
  it { should have_many :reports }

  it "has a valid factory" do
    expect(build(:review)).to be_valid
  end

  it "updates the average rating on the supplier after creation" do
    supplier = create(:supplier)
    review_one = create(:review, supplier: supplier, overall: 5)
    review_two = create(:review, supplier: supplier, overall: 3)
    expect(supplier.rating).to eq 4
  end

  it "returns author of itself" do
    expect(create(:review)).to respond_to :author
  end

  it "after creation it updates the rating on the supplier" do
    supplier = create(:supplier)
    expect {
      create(:review, supplier: supplier, overall: 5).to change(supplier.rating)
    }
  end

  it "has a class method #available that filters by hidden attributes" do
    visible_supplier = create(:review)
    hidden_supplier = create(:hidden_review)

    expect(Review.visible).to eq [visible_supplier]
  end
end
