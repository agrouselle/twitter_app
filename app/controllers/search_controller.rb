class SearchController < ApplicationController
  def index
    if params[:q].present?
      rpp = params[:rpp] || DEFAULT_NB_RESULTS
      @tweets = Twitter.search(params[:q], :rpp => rpp).results
    end
  end
end