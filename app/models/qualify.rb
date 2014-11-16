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
  field :status_ids, type: Array, default: []  
  field :qualify_type, type: Integer, default: 0
  field :type_ids, type: Array, default: []
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
  QUALIFY_TYPE = [[0, '建筑'], [1, '机电'], [2, '市政'], [3, '电力'], [4, '矿山'], [5, '水利水电'], [6, '通信'], [7, '冶金'], [8, '石油化工']]
  CORP_QUALIFY_STATUS = [[0, '单独找证'], [1, '全部委托']]
  CORP_REG_STATUS = [[0, '已注册公司'], [1, '未注册公司']]

  belongs_to :category
  belongs_to :segment
  has_many :replies

  scope :fields_for_list, -> { without(:details) }
  scope :agent_type_01, -> { where(agent_type: 0) }
  scope :agent_type_02, -> { where(agent_type: 1) }

  validates_presence_of :agent_type, :title, :locate_province, :locate_city, :qualify_status, \
                        :qualify_type, :corp_qualify_status, :corp_reg_status, :details, :company_name
end
