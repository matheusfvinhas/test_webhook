# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:repository) }
  it { should belong_to(:sender) }
  it { should belong_to(:issue) }
end
