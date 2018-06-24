# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  it { should have_and_belong_to_many(:issues) }
end
