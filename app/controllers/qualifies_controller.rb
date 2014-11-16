class QualifiesController < ApplicationController
  # GET /qualifies
  # GET /qualifies.json
  def index
    @qualifies = Qualify.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @qualifies }
    end
  end

  # GET /qualifies/1
  # GET /qualifies/1.json
  def show
    set_seo_meta t("menu.qualify")
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    @qualify = Qualify.find(params[:id])
    @qualify.inc(:hits, 1)
    add_breadcrumb t("breadcrumbs.publish_type_09"), '#', class: "link_4a1"
    # @replies = @qualify.replies

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qualify }
    end
  end

  # GET /qualifies/new
  # GET /qualifies/new.json
  def new
    set_seo_meta t("menu.qualify")
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    add_breadcrumb t("breadcrumbs.publish_type_09"), '#', class: "link_4a1"
    
    @qualify = Qualify.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @qualify }
    end
  end

  # GET /qualifies/1/edit
  def edit
    @qualify = Qualify.find(params[:id])
  end

  # POST /qualifies
  # POST /qualifies.json
  def create
    @qualify = Qualify.new(params[:qualify])
    @seg_id = params[:qualify][:segment_id]
    @cat_id = params[:qualify][:category_id]

    if !params[:qualify][:type].blank?
      case params[:qualify][:type]
      when '9'
        redirct_type = 'agent'
      else
        redirct_type = 'agent'
      end
    end

    respond_to do |format|
      if @qualify.save
        format.html { redirect_to home_qualify_path(type: redirct_type) }
        format.json { render json: @qualify, status: :created, location: @qualify }
      else
        format.html { render action: "new" }
        format.json { render json: @qualify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /qualifies/1
  # PUT /qualifies/1.json
  def update
    @qualify = Qualify.find(params[:id])

    respond_to do |format|
      if @qualify.update_attributes(params[:qualify])
        format.html { redirect_to @qualify, notice: 'Qualify was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @qualify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qualifies/1
  # DELETE /qualifies/1.json
  def destroy
    @qualify = Qualify.find(params[:id])
    @qualify.destroy

    respond_to do |format|
      format.html { redirect_to qualifies_url }
      format.json { head :no_content }
    end
  end
end
