class HomeController < ApplicationController 
  before_filter :authenticate_user!, only: [:publish, :add, :create]
  def index
    set_seo_meta t("menu.home_page")
    set_hightlight_nav(1)
    @seg_yjgcs = Segment.where(code: "yjgcs").first
    @seg_zjs = Segment.where(code: "zjs").first
    @seg_qtzs = Segment.where(code: "qtzs").first
    @seg_ejjzs = Segment.where(code: "ejjzs").first
    @seg_jls = Segment.where(code: "jls").first
    @seg_gysbgcs = Segment.where(code: "gysbgcs").first
    @seg_jgs = Segment.where(code: "jgs").first
    @seg_dqgcs = Segment.where(code: "dqgcs").first
    @seg_zczxs = Segment.where(code: "zczxs").first

    @seg_zzdb = Segment.where(for: "zz").all.limit(7)

    @seg_qz = Segment.where(for: "qz").first

    @resumes = Resume.where(resume_type: 2).recent.all.limit(9).to_a
    @qualifies = Qualify.fields_for_list.recent.all.limit(24).to_a
    # @resumes = Resume.resume_jianzhi.recent

    @useful_links = UsefulLink.all.limit(15)

    fresh_when(etag: [@seg_yjgcs, @seg_zjs, @seg_qtzs, @seg_ejjzs, @seg_jls, @seg_gysbgcs, @seg_jgs, @seg_dqgcs, @seg_zczxs, @seg_zzdb, @seg_qz, @resumes, @useful_links, SiteConfig.index_html])
  end

  def region
  end

  def publish
    set_seo_meta t("menu.publish")
    type_id = params[:type]
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    if not type_id.nil?      
      add_breadcrumb I18n.t("breadcrumbs.publish_type"), home_publish_path, :title => t("breadcrumbs.publish_type"), class: "link_4a1"
      @type_id = type_id
      if type_id == '4' or type_id == '7'
        @segments = Segment.where(for: "qz").all
        # @job_type = 1
      # elsif type_id == '3' or type_id == '1' or type_id == '5' or type_id == '6'
      elsif type_id == '1' or type_id == '2'
        @segments = Segment.where(for: "zs").all
        @job_type = type_id
        if type_id == '5'
          # @job_type = 1
        else type_id == '6'
          # @job_type = 2
        end
      elsif ( type_id == '9' or type_id == '10' )
        @segments = Segment.where(for: "zz").all
      else
        @segments = Segment.all
      end
    end
  end

  def publishresumes
    set_seo_meta t("menu.resume")
  end

  def qualify
    @qualify_type = params[:type]
    @segments = Segment.where(for: 'zz').all.to_a
    @qualifies = Qualify.fields_for_list.recent.all.to_a
    @qualifies_agent = Qualify.agent_type_01.fields_for_list.recent.to_a
    @qualifies_want = Qualify.agent_type_02.fields_for_list.recent.to_a

    # if !params[:type].blank?
    #   @qualify_type = params[:type] 
    #   if @qualify_type == "agent" or @qualify_type == "9"
    #     @segments = Segment.where(for: 'zz').all.to_a
    #     @qualifies = Qualify.all
    #     @qualifies_agent = Qualify.agent_type_01
    #     @qualifies_want = Qualify.agent_type_02
    #   else
    #     redirect_to home_qualify_path
    #   end
    # else
    #   redirect_to home_qualify_path
    # end

    if !params[:seg_name].blank?
      @seg_id = params[:seg_name]
      # seg = Segment.find(seg_id)
      @categories = Category.where(:segment_id => @seg_id)
      @qualifies = Qualify.where(:segment_id => @seg_id).recent.fields_for_list.to_a
    else
      # @categories = Category.where(:segment_id => Segment.where(for: 'zz').first.id).to_a
    end

    # add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"    

    if !params[:cat_name].blank?
      @cat_name = params[:cat_name]
      # @records = Record.where(:category_id => @cat_name)
      if @cat_name != 'a'
        # cat_title = Category.find(@cat_name).title
        # add_breadcrumb cat_title, "#", class: "link_4a1", onclick: "return false"
        @qualifies = Qualify.where(:category_id => @cat_name).recent.fields_for_list.to_a
      end
    else
      @cat_name = 'a'
    end

    if !params[:province].blank?
      province = params[:province]      
      if @cat_name != 'a'
        @qualifies = Qualify.where(locate_province: province, category_id: @cat_name).recent.fields_for_list.to_a
      else
        @qualifies = Qualify.where(locate_province: province).recent.fields_for_list.to_a
      end
    end
    fresh_when(etag: [@record])

  end

  def zizhi
    set_seo_meta t("menu.view")
    set_hightlight_nav(2)
    # @segments = Segment.where(for: 'zs').all.to_a
    @records = Record.all.recent

    if !params[:type].blank?
      @search_type = params[:type] 
      if @search_type == "agent"
        @segments = Segment.where(for: 'zz').all.to_a
      else
        @segments = Segment.where(for: 'zs').all.to_a
      end
    else
      @segments = Segment.where(for: 'zs').all.to_a
    end

    if !params[:seg_name].blank?
      @seg_id = params[:seg_name]
      # seg = Segment.find(seg_id)
      @categories = Category.where(:segment_id => @seg_id)
      @records = Record.where(:segment_id => @seg_id).recent.fields_for_list.to_a
    else
      @categories = Category.where(:segment_id => Segment.first.id).to_a
    end

    # add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"    

    if !params[:cat_name].blank?
      @cat_name = params[:cat_name]
      # @records = Record.where(:category_id => @cat_name)
      if @cat_name != 'a'
        # cat_title = Category.find(@cat_name).title
        # add_breadcrumb cat_title, "#", class: "link_4a1", onclick: "return false"
        @records = Record.where(:category_id => @cat_name).recent.fields_for_list.to_a
      end
    else
      @cat_name = 'a'
    end

    if !params[:province].blank?
      province = params[:province]      
      if @cat_name != 'a'
        @records = Record.where(locate_province: province, category_id: @cat_name).recent.fields_for_list.to_a
      else
        @records = Record.where(locate_province: province).recent.fields_for_list.to_a
      end
    end
    fresh_when(etag: [@record])
  end

  def add
    set_seo_meta t("menu.publish")
    # @record = Record.new
    @resume = Resume.new
    @record = Record.new
    @qualify = Qualify.new
    @seg_id = params[:seg]
    @cat_id = params[:cat]
    @seg_name = Segment.find(@seg_id).title
    @cat_name = Category.find(@cat_id).title

    @type_id = params[:type]
    add_breadcrumb t("breadcrumbs.homepage"), root_path, :title => t("breadcrumbs.homepage"), class: "link_4a1"
    add_breadcrumb t("breadcrumbs.publish_type_0#{@type_id}"), home_publish_path, :title => t("breadcrumbs.publish_type"), class: "link_4a1"
    add_breadcrumb @seg_name, publish_path, :title => @seg_name, class: "link_4a1" 

    if @type_id == '3' or @type_id == '4' or @type_id == '5'
      @job_type = 1
    elsif @type_id == '6'
      @job_type = 2      
    elsif @type_id == '9'
      @job_type = 3
    elsif @type_id == '1' or @type_id == '2'
      @job_type = @type_id
    end
    add_breadcrumb @cat_name, '#', class: "link_4a1", onclick: "return false"

    respond_to do |format|
      format.html # add.html.haml
    end
  end

  def create
    @record = Record.new(params[:record])    
    if current_user
      @record[:user_id] = current_user.id
      @record.contact_phone_number = current_user.phone_number
      if current_user.user_type != "geren"
        @record.company_name = current_user.company_name
      end      
    end

    respond_to do |format|
      if @record.save
        format.html { redirect_to publish_succeed_path, notice: t('.record_created_successfully.') }
        # format.json { render json: @maintain_invite_article, status: :created, location: @maintain_invite_article }
      else
        format.html { render action: "add" }
        # format.json { render json: @maintain_invite_article.errors, status: :unprocessable_entity }
      end
    end 
  end

  def publish_succeed
  end
end
