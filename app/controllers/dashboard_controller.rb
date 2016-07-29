class DashboardController < ApplicationController
  def index
    links = Link.group(:id).order("SUM(upvotes_count - downvotes_count) DESC").limit(10)
    render locals: { links: links }
  end
end
