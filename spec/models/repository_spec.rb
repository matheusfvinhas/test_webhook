# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should belong_to(:owner).class_name('User') }
  it { should have_many(:events) }

  it 'has a valid factory' do
    expect(FactoryBot.create(:repository)).to be_valid
  end
end
