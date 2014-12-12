class Category
  include Mongoid::Document
  field :code, type: String
  field :title, type: String
  field :top, type: Integer
  # embedded_in :segment, :inverse_of => :categories
  belongs_to :segment
  has_many :records
  has_many :resumes
  has_many :qualifies

  default_scope asc(:top)
end
