require 'spec_helper'

describe Advertisement do

  it { should belong_to :region }
  it { should belong_to :category }

  it { should validate_presence_of :start_date }
  it { should validate_presence_of :end_date }
  it { should validate_presence_of :contact_name }
  it { should validate_presence_of :contact_email }
  it { should validate_presence_of :image_url }
  it { should validate_presence_of :region_id }
  it { should validate_presence_of :category_id }
  it { should validate_presence_of :ad_type }

end
