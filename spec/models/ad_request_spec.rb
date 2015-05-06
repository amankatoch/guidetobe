require 'spec_helper'

describe AdRequest do

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :supplier_name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :contact_preference }
  it { should validate_presence_of :category_id }
  it { should validate_numericality_of :category_id }

  it "should validate the email" do
    expect(build(:ad_request, email: 'blah')).to_not be_valid
  end

  it { should belong_to :category}

end
