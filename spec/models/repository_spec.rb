# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should belong_to(:owner).class_name('User') }
  it { should have_many(:events) }
end
