class ProfileController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def show
    user_id = params[:id]
    @profile = User.find(user_id)
  end
end
