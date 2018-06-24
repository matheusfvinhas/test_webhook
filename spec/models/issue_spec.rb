# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Issue, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:assignee).class_name('User') }
  it { should have_many(:events) }
  it { should have_and_belong_to_many(:labels) }
  it { should have_many(:assignees).through(:issue_assignees).source(:user) }

  it 'has a valid factory' do
    expect(FactoryBot.create(:issue)).to be_valid
  end
end
