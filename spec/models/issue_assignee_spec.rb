# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IssueAssignee, type: :model do
  it { should belong_to(:issue) }
  it { should belong_to(:user) }
end
