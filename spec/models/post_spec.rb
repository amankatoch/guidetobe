require 'spec_helper'

describe Post do

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :author }
  it { should validate_presence_of :published_on }

  it 'should default to visible' do
    expect(create(:post).visible).to be_true
  end

  it 'should have a factory for an invisible post' do
    expect(create(:invisible_post)).to be_valid
  end
end
