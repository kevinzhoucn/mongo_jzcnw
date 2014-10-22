class Segment
  include Mongoid::Document
  field :code, type: String
  field :title, type: String
  embeds_many :categories
  accepts_nested_attributes_for :categories
end
