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
  
  field :company_location, type: String
  field :company_start_date, type: String
  field :company_reg_price, type: String
  belongs_to :category
  belongs_to :segment

  default_scope desc(:created_at)
end