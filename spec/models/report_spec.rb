require 'spec_helper'

describe Report do

  it { should belong_to :review }
  it { should belong_to :reportable }

end
