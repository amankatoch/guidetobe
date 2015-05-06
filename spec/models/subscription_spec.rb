require 'spec_helper'

describe Subscription do

  it { should belong_to :owner }
  it { should belong_to :product }
  it { should belong_to :sale }

  it 'should have a valid factory' do
    expect(create(:subscription)).to be_valid
  end

  it 'should have a valid factor for an invalid subscription' do
    expect(create(:invalid_subscription)).to_not be_in_date
  end

  it 'has a #in_date? method' do
    valid_subscription = create(:subscription, end_date: Date.today - 6.months)
    expect(valid_subscription.in_date?).to be_false
  end
end
