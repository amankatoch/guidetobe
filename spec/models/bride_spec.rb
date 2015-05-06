require 'spec_helper'

describe Bride do

  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :region }
  it { should validate_presence_of :postcode }
  it { should validate_presence_of :email }

  it "should validate uniqueness of :email" do
    create(:bride)
    validate_uniqueness_of :email
  end

  it 'should downcase the email before saving' do
    bride = create(:bride, email: 'USER@EXAMPLE.COM')
    expect(bride.email).to eq 'user@example.com'
  end

  it "should reject invalid email address" do
    expect(build(:bride, email: 'hello')).to_not be_valid
  end

  it { should validate_presence_of :age }
  it { should validate_presence_of :source }
  it { should validate_presence_of :wedding_date }
  it { should validate_presence_of :username }
  it { should validate_acceptance_of :terms }

  it { should have_secure_password }

  it { should have_many :reviews }
  it { should have_many :reports }
end