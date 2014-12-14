class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def show
    # user_id = params[:id]
    set_seo_meta t("menu.profile")
    @profile = User.find(current_user.id)
    @records = Record.all.limit(10)
  end

  def personal
    set_seo_meta t("menu.profile")
    @profile = User.find(current_user.id)
  end

  def company
    set_seo_meta t("menu.profile")
    @profile = User.find(current_user.id)
    @company = Company.where(:user_id => current_user.id).first

    if !@company
      @company = Company.new
    end
  end

  def personal_update
    @profile = User.find(current_user.id)

    respond_to do |format|
      if @profile.update_attributes(params[:user])
        format.html { redirect_to profile_show_path, notice: 'Personal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to profile_personal_path }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def company_update
    @company = Company.where(:user_id => current_user.id).first

    if !@company
      @company = Company.new
      @company[:user_id] = current_user.id
    end

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to profile_show_path, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to profile_company_path }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
end
