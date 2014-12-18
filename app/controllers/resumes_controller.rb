class ResumesController < ApplicationController
  # GET /resumes
  # GET /resumes.json
  def index
    set_seo_meta t("menu.resume")
    set_hightlight_nav(4)

    @resumes = Resume.all.recent
    @segments = Segment.where(for: 'zs').all.to_a

    if !params[:seg_name].blank?
      @seg_id = params[:seg_name]
      @categories = Category.where(:segment_id => @seg_id)
      @resumes = Resume.where(:segment_id => @seg_id).recent.fields_for_list.to_a
    else
      @categories = Category.where(:segment_id => Segment.first.id).to_a
    end

    if !params[:cat_name].blank?
      @cat_name = params[:cat_name]
      # @resumes = Resume.where(:category_id => @cat_name)
      if @cat_name != 'a'
        # cat_title = Category.find(@cat_name).title
        # add_breadcrumb cat_title, "#", class: "link_4a1", onclick: "return false"
        @resumes = Resume.where(:category_id => @cat_name).recent.fields_for_list.to_a
      end
    else
      @cat_name = 'a'
    end

    if !params[:province].blank?
      province = params[:province]      
      if @cat_name != 'a'
        @resumes = Resume.where(work_province: province, category_id: @cat_name).recent.fields_for_list.to_a
      else
        @resumes = Resume.where(work_province: province).recent.fields_for_list.to_a
      end
    end
    fresh_when(etag: [@resumes])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resumes }
    end
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    set_seo_meta t("menu.resume")
    @resume = Resume.find(params[:id])
    @resume.inc(:hits, 1)
    
    fresh_when(etag: [@resume])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resume }
    end
  end

  # GET /resumes/new
  # GET /resumes/new.json
  def new
    set_seo_meta t("menu.publish")
    @resume = Resume.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume }
    end
  end

  # GET /resumes/1/edit
  def edit
    @resume = Resume.find(params[:id])
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(params[:resume])
    @seg_id = params[:resume][:segment_id]
    @cat_id = params[:resume][:category_id]
    @type_id = params[:resume][:resume_type]
    # back_link = '/publish/2/add?seg=#{seg_id}&cat=#{cat_id}'

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "new"}
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resumes/1
  # PUT /resumes/1.json
  def update
    @resume = Resume.find(params[:id])

    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy

    respond_to do |format|
      format.html { redirect_to resumes_url }
      format.json { head :no_content }
    end
  end
end
