class Company
  include Mongoid::Document
  field :name, type: String
  field :summary, type: String
  field :website, type: String
  field :contact, type: String
  field :desk_phone, type: String
  field :corp_email, type: String
  field :corp_province, type: String
  field :corp_city, type: String
  field :corp_address, type: String 

  mount_uploader :avatar, AvatarUploader

  belongs_to :user

  attr_accessible :name, :summary, :website, :contact, :desk_phone, :corp_email, :corp_province, :corp_city, :corp_address
end
