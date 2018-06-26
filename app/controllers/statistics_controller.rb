# frozen_string_literal: true

class StatisticsController < ApplicationController
  def show
    json_response(Issue.statistics(params[:type]))
  end
end
