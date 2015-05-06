require 'spec_helper'

describe Admin do
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }

  it "should validate uniqueness of :email" do
    create(:admin)
    validate_uniqueness_of :email
  end

  it { should have_secure_password }
end
