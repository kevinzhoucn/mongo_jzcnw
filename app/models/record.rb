class Record < ActiveRecord::Base
  attr_accessible :details, :job_title, :locate_city, :locate_province, :price, :register_status, :title
end
