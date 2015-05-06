require 'spec_helper'

describe Invoice do
  it { should belong_to :advertisement }

  it { should validate_presence_of :date }
  it { should validate_presence_of :reference }
  it { should validate_presence_of :email }
  it { should validate_presence_of :amount }
  it { should validate_presence_of :advertisement_id }

  it 'should have a valid factory' do
    expect(build(:invoice)).to be_valid
  end

  it 'should have a valid factory for a paid invoice' do
    expect(create(:paid_invoice).paid).to be_true
  end

end
