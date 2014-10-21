class Article
  include Mongoid::Document
  field :name, type: String
  field :content, type: String
  field :published_on, :type => Date

  validates_presence_of :name
  embeds_many :comments
  belongs_to :author
  accepts_nested_attributes_for :comments
end
