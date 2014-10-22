#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'DEFAULT USERS'
# user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name

# admin = User.create(name: "admin01", email: "admin01@jzcnw.com", password: "password")
# admin.add_role :admin
# puts 'admin: ' << admin.name

# admin = User.create(name: "admin02", email: "admin02@jzcnw.com", password: "password")
# admin.add_role :admin
# puts 'admin: ' << admin.name

# admin = User.create(name: "admin02", email: "admin03@jzcnw.com", password: "password")
# admin.add_role :admin
# puts 'admin: ' << admin.name

# admin = User.create(name: "admin02", email: "admin04@jzcnw.com", password: "password")
# admin.add_role :admin
# puts 'admin: ' << admin.name

# user = User.create(name: "user01", email: "user01@jzcnw.com", password: "password")
# puts 'user: ' << user.name
# categories = Category.create!([code: "jzs", title: "建造师"], [code: "xmjl", title: "项目经理"],
#   [code: "xmgl", title: "项目管理"])
#segment = Segment.create(code: "gcxmgl", title: "工程/项目管理")#, categories: ([code: "jzs", title: "建造师"], [code: "xmjl", title: "项目经理"], [code: "xmgl", title: "项目管理"]))
segment = Segment.create!(code: "gcxmgl", title: "工程/项目管理", 
  categories: [{code: "jzs", title: "建造师"}, {code: "xmjl", title: "项目经理"},
               {code: "xmgl", title: "项目管理"}, {code: "gcs", title: "工程师"},
               {code: "zrgcs", title: "责任工程师"}, {code: "gz", title: "工长"},
               {code: "zxpggw", title: "咨询/评估/顾问"}, {code: "jhkzgcs", title: "计划控制工程师"},
               ])

segment = Segment.create!(code: "jcsj", title: "建筑设计", 
  categories: [{code: "jzsjs", title: "建筑师/建筑设计师"}, {code: "zjzs", title: "建筑师/建筑设计师"},
               {code: "sgtsjs", title: "施工图设计师"}, {code: "fasjs", title: "方案设计师"},
               {code: "stgcs", title: "审图工程师"}, {code: "qt", title: "其他"}
               ])

segment = Segment.create!(code: "szlq", title: "市政/路桥", 
  categories: [{code: "szgcs", title: "市政工程师"}, {code: "glsdql", title: "公路/隧道/桥梁工程师"},
               {code: "csghsj", title: "城市/市政规划设计师"}, {code: "qt", title: "其他"}
               ])

segment = Segment.create!(code: "jzqt", title: "建筑其他", 
  categories: [{code: "gjggcs", title: "钢结构工程师"}, {code: "yljgsjs", title: "园林/景观设计师"},
               {code: "ztbygcs", title: "招投标员/工程师"}, {code: "hjgcs", title: "环境工程师"},
               {code: "qt", title: "其他"}])

segment = Segment.create!(code: "jzqt", title: "建筑其他", 
  categories: [{code: "gjggcs", title: "钢结构工程师"}, {code: "yljgsjs", title: "园林/景观设计师"},
               {code: "ztbygcs", title: "招投标员/工程师"}, {code: "hjgcs", title: "环境工程师"},
               {code: "qt", title: "其他"}])