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

    @seg_qz = Segment.where(for: "qz").first
  end

  def show
    @record = Record.find(params[:id])
  end

  def region
  end

  def publish
    type_id = params[:type].to_s
    if not type_id.nil?      
      @type_id = type_id
      if type_id = '4'
        @segments = Segment.where(for: "qz").all
      elsif type_id = '3'
        @segments = Segment.where(for: "zs").all
      end
    end
  end

  def zizhi
    @records = Record.all
  end

  def add
    @record = Record.new
    @seg_id = params[:seg]
    @cat_id = params[:cat]

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
