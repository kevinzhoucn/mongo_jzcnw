class Resume
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel

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

  field :resume_type, type: Integer
  field :job_title, type: Integer
  field :guakao_price, type: String

  mount_uploader :avatar, AvatarUploader
  
  belongs_to :category
  belongs_to :segment

  validates_presence_of :name, :mobile, :edu_level, :person_summary
  validates_presence_of :resume_title, :work_province, :work_city, :price_month, if: :quanzhi_type?
  
  validates_presence_of :job_title, :guakao_price, :register_status, if: :jianzhi_type?

  scope :resume_jianzhi, -> {where(:resume_type => 2)}

  def birthday
    if !birth_day.blank? && !birth_month.blank? && !birth_day.blank?
      birth_year + '-' + birth_month + '-' + birth_day
    end
  end

  protected
    def jianzhi_type?
        resume_type == 1
    end

    def quanzhi_type?
        resume_type == 2
    end
end
