# coding: utf-8
class Qualify
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel

  field :title, type: String
  field :locate_province, type: String
  field :locate_city, type: String
  field :locate_region, type: String

  field :agent_type, type: Integer
  field :qualify_status, type: Integer, default: 0
  field :qualify_type, type: Integer, default: 1
  field :corp_qualify_status, type: Integer, default: 0
  field :corp_reg_status, type: Integer, default: 0
  field :details, type: String
  field :contact, type: String
  field :contact_phone, type: String
  field :contact_alternate, type: String
  field :qq, type: String
  field :website, type: String
  field :company_name, type: String
  field :source, type: Integer

  field :hits, type: Integer, default: 0

  AGENT_TYPE = [[0, '中介代办'], [1, '要办资质']]
  QUALIFY_STATUS = [[0, '新办'], [1, '三升二'], [2, '二升一'], [3, '一升特']]
  # QUALIFY_STATUS = [['0', '新办'], ['1', '三升二'], ['2', '二升一'], ['3', '一升特']]
  QUALIFY_TYPE = [['1', '建筑'], ['2', '机电'], ['3', '市政'], ['4', '电力'], ['5', '矿山'], ['6', '水利水电'], ['7', '通信'], ['8', '冶金'], ['9', '石油化工']]
  CORP_QUALIFY_STATUS = [[1, '单独找证'], [2, '全部委托']]
  CORP_REG_STATUS = [[1, '已注册公司'], [2, '未注册公司']]

  belongs_to :category
  belongs_to :segment
  has_many :replies

  scope :fields_for_list, -> { without(:details) }
  scope :agent_type_01, -> { where(agent_type: 1) }
  scope :agent_type_02, -> { where(agent_type: 2) }

  validates_presence_of :agent_type, :title, :locate_province, :locate_city, :qualify_status, \
                        :qualify_type, :corp_qualify_status, :corp_reg_status, :details, :company_name
end
