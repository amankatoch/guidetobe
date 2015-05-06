require 'spec_helper'

describe Reply do
  it { should belong_to(:review)}
  it { should belong_to(:owner)}

  it { should validate_presence_of(:body) }
end
