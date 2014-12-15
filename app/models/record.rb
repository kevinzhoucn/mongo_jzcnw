class Record
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel
  include Mongoid::CounterCache
  # include Redis::Objects

  field :details, type: String
  field :job_title, type: String
  field :locate_city, type: String
  field :locate_province, type: String
  field :price, type: String
  field :register_status, type: String
  field :title, type: String
  field :job_type, type: Integer
  # field :record_type, type: Integer
  
  field :company_name, type: String
  field :contact_phone_number, type: String
  field :company_location, type: String
  field :company_start_date, type: String
  field :company_reg_price, type: String

  field :hits, type: Integer, default: 0

  belongs_to :category
  belongs_to :segment
  belongs_to :user
  has_many :replies

  # default_scope desc(:created_at)

  validates_presence_of :title, :details
  validates_presence_of :locate_province, :locate_city, :register_status, if: :zhengshu_type?
  validates_presence_of :company_location, :company_reg_price, if: :zizhi_type?

  # counter :hits, default: 0
  scope :fields_for_list, -> { without(:details) }

  def get_user_name
    record_contact = ''
    if user_id
      return self.user.user_name
    end
  end

  def get_company_name
    company_name = ''
    if user_id
      if self.user.company
        if !self.user.company.name.blank?
          self.user.company.name
        end
      end
    end
  end

  protected
    def zhengshu_type?
      job_type.blank? or job_type == 1 or job_type == 2
    end

    def zizhi_type?
      !job_type.blank? && job_type == 3
    end
end