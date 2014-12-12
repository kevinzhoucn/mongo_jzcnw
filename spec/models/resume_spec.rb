require 'spec_helper'

describe Resume do  
  before :each do
    @city_list = ChinaCity.list
  end

  it "get all provinces list from china" do
    puts city_list.first
  end
end
