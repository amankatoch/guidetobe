require 'spec_helper'

describe Region do

  it "has a valid factory" do
    expect(build(:region)).to be_valid
  end

  it { should validate_presence_of :name}
  it { should validate_presence_of :description }
  it { should have_many :suppliers }
  it { should have_many(:reviews).through(:suppliers)}
  it { should have_many :advertisements }
end