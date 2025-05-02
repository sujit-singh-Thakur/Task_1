class SearchController < ApplicationController
  def index
  @tasks = User.valid_scope(params[:status])
  end
end
