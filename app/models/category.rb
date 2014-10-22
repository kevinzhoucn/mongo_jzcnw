class Category
  include Mongoid::Document
  field :code, type: String
  field :title, type: String
  embedded_in :segment, :inverse_of => :categories
  has_many :records
end
