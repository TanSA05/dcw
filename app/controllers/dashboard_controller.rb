class DashboardController < ApplicationController
	before_action :authenticate_user!

  def index
  end

  def insights
  end
end
