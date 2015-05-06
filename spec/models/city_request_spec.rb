require 'spec_helper'

describe CityRequest do

  it "should have a valid factory" do
    expect(build(:city_request)).to be_valid
  end

  it { should validate_presence_of :region }
  it { should validate_presence_of :email }
  it { should validate_presence_of :wedding_date }

  it "should reject an invalid email address on the request" do
    expect(build(:city_request, email: 'test')).to_not be_valid
  end

end
