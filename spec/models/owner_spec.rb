require 'spec_helper'

describe Owner do

  it 'has a valid factory' do
    expect(create(:owner)).to be_valid
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:product_id)}
  it { should validate_presence_of(:password)}
  it { should validate_presence_of(:password_confirmation)}

  it 'should not allow invalid email address' do
    expect(build(:owner, email: 'blah')).to_not be_valid
  end

  it { should validate_acceptance_of :terms }
  it { should belong_to(:supplier) }
  it { should belong_to(:product)}
  it { should have_secure_password }
  it { should have_many(:reports)}
  it { should have_many(:sales)}
  it { should have_many(:replies)}
  it { should have_many(:subscriptions)}

  it 'has a name method' do
    owner = create(:owner, first_name: 'John', last_name: 'Smith')
    expect(owner.name).to eq 'John Smith'
  end

  it 'declares whether it owns a supplier' do
    correct_supplier = create(:supplier)
    owner = create(:owner, supplier: correct_supplier)
    incorrect_supplier = create(:supplier)

    expect(owner.owns?(incorrect_supplier)).to be_false
  end

  it 'delegates supplier_name' do
    supplier = create(:supplier, name: 'Bob')
    owner = create(:owner, supplier: supplier)
    expect(owner.supplier_name).to eq 'Bob'
  end

  it 'has a #valid_subscription method that return true for a completed sale for the right product' do
    product = create(:product)
    owner = create(:owner, product: product)
    create(:sale, owner: owner, product: product)
    sale = create(:finished_sale, owner: owner, product: product)
    create(:subscription, owner: owner, sale: sale, product: product )

    expect(owner.has_valid_subscription?).to be_true
  end

  it 'has a #valid_subscription method that returns false for an incomplete sale for the right product' do
    product = create(:product)
    owner = create(:owner, product: product)
    create(:sale, owner: owner, product: product)
    expect(owner.has_valid_subscription?).to be_false
  end
end
