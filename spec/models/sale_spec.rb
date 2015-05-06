require 'spec_helper'

describe Sale do
  it { should belong_to :product }
  it { should belong_to :owner }

  it "should have a valid factory for a pending sale" do
    expect(create(:sale)).to be_valid
  end

  it "should have a valid factory for a finished sale" do
    expect(create(:finished_sale)).to be_valid
  end
end
