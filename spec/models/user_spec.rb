# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:issues) }
  it { should have_many(:repositories).with_foreign_key('owner_id') }
  it { should have_many(:events).with_foreign_key('sender_id') }
end
