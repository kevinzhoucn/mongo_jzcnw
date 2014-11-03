class HomeController < ApplicationController
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

    @resumes = Resume.desc(:created_at).all.limit(9)

    @useful_links = UsefulLink.all.limit(15)
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
      if type_id == '4' or type_id == '2'
        @segments = Segment.where(for: "qz").all
      elsif type_id == '3' or type_id == '1'
        @segments = Segment.where(for: "zs").all
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
    @records = Record.all

    if !params[:cat_name].blank?
      cat_name = params[:cat_name]
      @records = Record.where(:category_id => cat_name)
    end

    if !params[:province].blank?
      province = params[:province]
      @records = Record.where(locate_province: province)
    end
  end

  def add
    # @record = Record.new
    @resume = Resume.new
    @seg_id = params[:seg]
    @cat_id = params[:cat]

    @type_id = params[:type]

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
