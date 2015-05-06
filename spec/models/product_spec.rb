require 'spec_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :year_price }
  it { should validate_numericality_of :year_price }
  it { should have_many :sales }
  it { should have_many :owners }
  it { should have_many :subscriptions }

  it 'should have a valid factory' do
    expect(create(:product)).to be_valid
  end

end
