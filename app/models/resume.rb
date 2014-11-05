class Resume
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :sex, type: String
  field :mobile, type: String
  field :birth_year, type: Integer
  field :birth_month, type: Integer
  field :birth_day, type: Integer
  field :email, type: String
  field :qq, type: String
  field :work_year, type: String
  field :edu_level, type: String
  field :register_status, type: String
  field :social_security, type: String
  field :security_b, type: String
  field :intend_price, type: String  
  field :person_summary, type: String

  field :resume_title, type: String
  field :work_province, type: String
  field :work_city, type: String
  field :price_month, type: String
  
  belongs_to :category
  belongs_to :segment

  validates_presence_of :name, :mobile, :register_status, :edu_level, :social_security, :security_b, :intend_price, :person_summary, :resume_title, :work_province, :work_city, :price_month

  def birthday
    if !birth_day.blank? && !birth_month.blank? && !birth_day.blank?
      birth_year + '-' + birth_month + '-' + birth_day
    end
  end
end
