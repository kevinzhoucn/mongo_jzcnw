class Segment
  include Mongoid::Document
  field :code, type: String
  field :title, type: String
  field :for, type: String
  # embeds_many :categories
  has_many :categories
  accepts_nested_attributes_for :categories
  has_many :records
  has_many :resumes
end
