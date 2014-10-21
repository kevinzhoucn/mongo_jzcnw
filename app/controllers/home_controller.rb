class HomeController < ApplicationController
  def index
    @news = News.all
    @policies = Policy.all
  end

  def show
    @record = Record.find(params[:id])
  end

  def region
  end

  def publish
    type_id = params[:type]
    if not type_id.nil?
      @type_id = type_id
    end
  end

  def zizhi
    @records = Record.all
  end

  def add
    @record = Record.new

    respond_to do |format|
      format.html # add.html.haml
    end
  end

  def create
    @record = Record.new(params[:record])

    respond_to do |format|
      if @record.save
        format.html { redirect_to zizhi_daiban_path, notice: t('.record_created_successfully.') }
        # format.json { render json: @maintain_invite_article, status: :created, location: @maintain_invite_article }
      else
        format.html { render action: "add" }
        # format.json { render json: @maintain_invite_article.errors, status: :unprocessable_entity }
      end
    end 
  end
end
