# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  it { should have_and_belong_to_many(:issues) }

  it 'has a valid factory' do
    expect(FactoryBot.create(:label)).to be_valid
  end
end
