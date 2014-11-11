# coding: utf-8
class Reply
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::BaseModel

  attr_accessible :body, :source

  field :body, type: String
  field :source, type: String
  
  belongs_to :user, inverse_of: :replies
  belongs_to :record, inverse_of: :replies, touch: true

  index user_id: 1
  index record_id: 1

  validates_presence_of :body
  # validates_uniqueness_of :body, scope: [:record_id, :user_id], message: "不能重复提交。"
end
