class HomeController < ApplicationController 
  before_filter :authenticate_user!, only: [:publish, :add, :create]
  def index
    @seg_yjgcs = Segment.where(code: "yjgcs").first
    @seg_zjs = Segment.where(code: "zjs").first
    @seg_qtzs = Segment.where(code: "qtzs").first
    @seg_ejjzs = Segment.where(code: "ejjzs").first
    @seg_jls = Segment.where(code: "jls").first
    @seg_gysbgcs = Segment.where(code: "gysbgcs").first
    @seg_jgs = Segment.where(code: "jgs").first
    @seg_dqgcs = Segment.where(code: "dqgcs").first
    @seg_zczxs = Segment.where(code: "zczxs").first

    @seg_zzdb = Segment.where(code: "zzdb").first

    @seg_qz = Segment.where(for: "qz").first

    @resumes = Resume.where(resume_type: 2).desc(:created_at).all.limit(9)

    @useful_links = UsefulLink.all.limit(15)
  end

  def show
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    @record = Record.find(params[:id])
    cat_title = Category.find(@record.category_id).title
    add_breadcrumb cat_title, zizhi_daiban_path(@record.category_id), class: "link_4a1"#, onclick: "return false"
  end

  def region
  end

  def publish
    type_id = params[:type]
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    if not type_id.nil?      
      add_breadcrumb I18n.t("breadcrumbs.publish_type"), home_publish_path, :title => t("breadcrumbs.publish_type"), class: "link_4a1"
      @type_id = type_id
      if type_id == '4' or type_id == '2' or type_id == '7'
        @segments = Segment.where(for: "qz").all
        # @job_type = 1
      elsif type_id == '3' or type_id == '1' or type_id == '5' or type_id == '6'
        @segments = Segment.where(for: "zs").all
        if type_id == '5'
          # @job_type = 1
        else type_id == '6'
          # @job_type = 2
        end
      elsif ( type_id == '9' or type_id == '10' )
        @segments = Segment.where(for: "db").all
      else
        @segments = Segment.all
      end
    end
  end

  def publishresumes

  end

  def zizhi
    @segments = Segment.where(for: 'zs').all
    @records = Record.all

    if !params[:seg_name].blank?
      @seg_id = params[:seg_name]
      # seg = Segment.find(seg_id)
      @categories = Category.where(:segment_id => @seg_id)
      @records = Record.where(:segment_id => @seg_id)
    else
      @categories = Category.where(:segment_id => Segment.first.id)
    end

    # add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"    

    if !params[:cat_name].blank?
      @cat_name = params[:cat_name]
      # @records = Record.where(:category_id => @cat_name)
      if @cat_name != 'a'
        # cat_title = Category.find(@cat_name).title
        # add_breadcrumb cat_title, "#", class: "link_4a1", onclick: "return false"
        @records = Record.where(:category_id => @cat_name)
      end
    else
      @cat_name = 'a'
    end

    if !params[:province].blank?
      province = params[:province]      
      if @cat_name != 'a'
        @records = Record.where(locate_province: province, category_id: @cat_name)
      else
        @records = Record.where(locate_province: province)
      end
    end
  end

  def add
    # @record = Record.new
    @resume = Resume.new
    @record = Record.new
    @seg_id = params[:seg]
    @cat_id = params[:cat]
    seg_name = Segment.find(@seg_id).title
    cat_name = Category.find(@cat_id).title

    @type_id = params[:type]
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    add_breadcrumb t("breadcrumbs.publish_type_0#{@type_id}"), home_publish_path, :title => t("breadcrumbs.publish_type"), class: "link_4a1"
    add_breadcrumb seg_name, publish_path, :title => seg_name, class: "link_4a1" 

    if @type_id == '3' or @type_id == '4' or @type_id == '5'
      @job_type = 1
    elsif @type_id == '6'
      @job_type = 2      
    elsif @type_id == '9'
      @job_type = 3
    end
    add_breadcrumb cat_name, '#', class: "link_4a1", onclick: "return false"

    respond_to do |format|
      format.html # add.html.haml
    end
  end

  def create
    @record = Record.new(params[:record])
    if current_user
      @record.contact_phone_number = current_user.phone_number
      if current_user.user_type != "geren"
        @record.company_name = current_user.company_name
      end      
    end

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
