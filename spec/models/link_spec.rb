require 'rails_helper'

RSpec.describe Link, type: :model do
  it 'has a valid factory' do
    create(:link).should be_valid
  end

  it 'is invalid without a href' do
    build(:link, href: nil).should_not be_valid
  end

  it 'is invalid without a user' do
    build(:link, user: nil).should_not be_valid
  end
end
