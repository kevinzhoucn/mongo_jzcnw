class Record
  include Mongoid::Document
  include Mongoid::Timestamps
  field :details, type: String
  field :job_title, type: String
  field :locate_city, type: String
  field :locate_province, type: String
  field :price, type: String
  field :register_status, type: String
  field :title, type: String
  field :job_type, type: Integer
  
  field :company_name, type: String
  field :contact_phone_number, type: String
  field :company_location, type: String
  field :company_start_date, type: String
  field :company_reg_price, type: String
  belongs_to :category
  belongs_to :segment

  default_scope desc(:created_at)

  validates_presence_of :title, :details
  validates_presence_of :locate_province, :locate_city, :register_status, if: :zhengshu_type?
  validates_presence_of :company_location, :company_reg_price, if: :zizhi_type?

  protected
    def zhengshu_type?
      job_type.blank? or job_type == 1 or job_type == 2
    end

    def zizhi_type?
      !job_type.blank? && job_type == 3
    end
end