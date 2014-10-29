class ProfileController < ApplicationController
  def index
  end

  def show
    user_id = params[:id]
    @profile = User.find(user_id)
  end
end
