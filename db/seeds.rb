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

User.delete_all
admin = User.create(name: "admin01", email: "admin01@jzcnw.com", password: "password")
admin.add_role :admin
puts 'admin: ' << admin.name

admin = User.create(name: "admin02", email: "admin02@jzcnw.com", password: "password")
admin.add_role :admin
puts 'admin: ' << admin.name

admin = User.create(name: "admin03", email: "admin03@jzcnw.com", password: "password")
admin.add_role :admin
puts 'admin: ' << admin.name

admin = User.create(name: "admin04", email: "admin04@jzcnw.com", password: "password")
admin.add_role :admin
puts 'admin: ' << admin.name

user = User.create(name: "user01", email: "user01@jzcnw.com", password: "password")
puts 'user: ' << user.name

user = User.create(name: "user02", email: "user02@jzcnw.com", password: "password")
puts 'user: ' << user.name
# user = User.create(name: "user01", email: "user01@jzcnw.com", password: "password")
# puts 'user: ' << user.name
# categories = Category.create!([code: "jzs", title: "建造师"], [code: "xmjl", title: "项目经理"],
#   [code: "xmgl", title: "项目管理"])
#segment = Segment.create(code: "gcxmgl", title: "工程/项目管理")#, categories: ([code: "jzs", title: "建造师"], [code: "xmjl", title: "项目经理"], [code: "xmgl", title: "项目管理"]))

# 全职招聘部分
Category.delete_all
Segment.delete_all
Record.delete_all
categories = Category.create! ([{code: "jzs", title: "建造师"}, {code: "xmjl", title: "项目经理"},
               {code: "xmgl", title: "项目管理"}, {code: "gcs", title: "工程师"},
               {code: "zrgcs", title: "责任工程师"}, {code: "gz", title: "工长"},
               {code: "zxpggw", title: "咨询/评估/顾问"}, {code: "jhkzgcs", title: "计划控制工程师"},
               ])
segment = Segment.create!(code: "gcxmgl", title: "工程/项目管理", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "szgcs", title: "市政工程师"}, {code: "glsdql", title: "公路/隧道/桥梁工程师"},
               {code: "csghsj", title: "城市/市政规划设计师"}, {code: "qt", title: "其他"}
               ])
segment = Segment.create!(code: "szlq", title: "市政/路桥", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "gjggcs", title: "钢结构工程师"}, {code: "yljgsjs", title: "园林/景观设计师"},
               {code: "ztbygcs", title: "招投标员/工程师"}, {code: "hjgcs", title: "环境工程师"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "jzqt", title: "建筑其他", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "snsjs", title: "室内设计师"}, {code: "zssjs", title: "装饰设计师/工程师"},
               {code: "fdckf", title: "房地产开发"}, {code: "zxgcs", title: "咨询工程师"},
               {code: "wyjl", title: "物业经理/主任/主管"}, {code: "qt", title: "其他"}])
segment = Segment.create!(code: "fdczx", title: "房地产/装修",  categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "gjggcs", title: "土建工程师"}, {code: "xsdzgcs", title: "岩土/地质工程师"},
               {code: "jggcs", title: "结构工程师"}, {code: "zgcs", title: "总工程师/高级工程师"},
               {code: "slsdgcs", title: "水利水电工程师"}, {code: "gczj", title: "工程总监"},
               {code: "xcgcs", title: "现场工程师"}, {code: "qt", title: "其他"}])
segment = Segment.create!(code: "tmgc", title: "土木/工程", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "zjygcs", title: "造价员/工程师"}, {code: "pgjg", title: "普工/技工"},
               {code: "jlygcs", title: "监理员/工程师"}, {code: "zlyaqy", title: "资料员/安全员"},
               {code: "sgy", title: "施工员"}, {code: "ysy", title: "预算员/工程师"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "zygcs", title: "专员/工程师", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "jpsgcs", title: "给排水工程师"}, {code: "ntrlgsc", title: "暖通/热力工程师"},
               {code: "dqgcs", title: "电气工程师"}, {code: "sngcs", title: "水暖工程师"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "jzqt", title: "给排水/暖通", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "cw", title: "财务"}, {code: "gcgl", title: "高层管理"},
               {code: "xzhq", title: "行政后勤/文秘/助理"}, {code: "rlzy", title: "人力资源"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "zhgl", title: "综合管理", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "dhxs", title: "电话销售"}, {code: "xsdb", title: "销售代表"},
               {code: "zjjl", title: "总监/经理/主管"}, {code: "sctg", title: "市场推广"},
               {code: "xszl", title: "销售助理"}, {code: "zyxs", title: "专业营销"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "xssc", title: "销售/市场/营销", categories: categories)
segment.for = "qz"
segment.save

categories = Category.create! ([{code: "jzgc", title: "建筑工程"}, {code: "szgy", title: "市政公用"},
               {code: "jdgc", title: "机电工程"}, {code: "slsd", title: "水利水电"},
               {code: "glgc", title: "公路工程"}, {code: "kygc", title: "矿业工程"},
               {code: "txygd", title: "通信与广电"}, {code: "gkhd", title: "港口与航道"},
               {code: "tlgc", title: "铁路工程"}, {code: "mhjc", title: "民航机场"}])
segment = Segment.create!(code: "yjgcs", title: "一级建造师", categories: categories, for: "zs")

categories = Category.create! ([{code: "jzgc", title: "建筑工程"}, {code: "jdgc", title: "机电工程"},
               {code: "szgygc", title: "市政公用工程"}, {code: "slsdgc", title: "水利水电工程"},
               {code: "glgc", title: "公路工程"}, {code: "kygc", title: "矿业工程"}])
segment = Segment.create!(code: "ejjzs", title: "二级建造师", categories: categories, for: "zs")

categories = Category.create! ([{code: "jsb", title: "建设部"}, {code: "slb", title: "水利部"},
               {code: "jtb", title: "交通部"}])
segment = Segment.create!(code: "zjs", title: "造价师", categories: categories, for: "zs")

categories = Category.create! ([{code: "yjjgs", title: "一级结构师"}, {code: "ejjgs", title: "二级结构师"}])
segment = Segment.create!(code: "jgs", title: "结构师", categories: categories, for: "zs")

categories = Category.create! ([{code: "jsb", title: "建设部"}, {code: "slb", title: "水利部"},
               {code: "jtb", title: "交通部"}])
segment = Segment.create!(code: "jls", title: "监理师", categories: categories, for: "zs")

categories = Category.create! ([{code: "gpd", title: "供配电"}, {code: "fsbd", title: "发输变电"}])
segment = Segment.create!(code: "dqgcs", title: "电气工程师", categories: categories, for: "zs")

categories = Category.create! ([{code: "ntkt", title: "暖通空调"}, {code: "jsps", title: "给水排水"},
               {code: "dl", title: "动力"}])
segment = Segment.create!(code: "gysbgcs", title: "公用设备工程师", categories: categories, for: "zs")

categories = Category.create! ([{code: "hjgchstjs", title: "环境工程和生态建设"}, {code: "szgygc", title: "市政公用工程"}])
segment = Segment.create!(code: "zczxs", title: "注册咨询师", categories: categories, for: "zs")

categories = Category.create! ([{code: "csghs", title: "城市规划师"}, {code: "hpgcs", title: "环评工程师"},
               {code: "fdcgjs", title: "房地产估价师"}])
segment = Segment.create!(code: "qtzs", title: "其他证书", categories: categories, for: "zs")

categories = Category.create! ([{code: "zcbzzbl", title: "总承包资质办理"}, {code: "yllhzzdb", title: "园林绿化资质代办"},
               {code: "sjsgythzz", title: "施工专业承包资质"}, {code: "yllhzzdb", title: "设计施工一体化资质"},
               {code: "yllhzzdb", title: "代办劳务分包资质"},{code: "sjsgythzz", title: "代办企业资质"},
               {code: "yllhzzdb", title: "建筑企业资质办理"}])
segment = Segment.create!(code: "zzdb", title: "资质代办", categories: categories, for: "db")

# segment = segment.categories.push(categories)
# segment.categories.reload

# segment = Segment.create!(code: "jcsj", title: "建筑设计", 
#   categories: [{code: "jzsjs", title: "建筑师/建筑设计师"}, {code: "zjzs", title: "建筑师/建筑设计师"},
#                {code: "sgtsjs", title: "施工图设计师"}, {code: "fasjs", title: "方案设计师"},
#                {code: "stgcs", title: "审图工程师"}, {code: "qt", title: "其他"}
#                ])

# segment = Segment.create!(code: "szlq", title: "市政/路桥", 
#   categories: [{code: "szgcs", title: "市政工程师"}, {code: "glsdql", title: "公路/隧道/桥梁工程师"},
#                {code: "csghsj", title: "城市/市政规划设计师"}, {code: "qt", title: "其他"}
#                ])

# segment = Segment.create!(code: "jzqt", title: "建筑其他", 
#   categories: [{code: "gjggcs", title: "钢结构工程师"}, {code: "yljgsjs", title: "园林/景观设计师"},
#                {code: "ztbygcs", title: "招投标员/工程师"}, {code: "hjgcs", title: "环境工程师"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "fdczx", title: "房地产/装修", 
#   categories: [{code: "snsjs", title: "室内设计师"}, {code: "zssjs", title: "装饰设计师/工程师"},
#                {code: "fdckf", title: "房地产开发"}, {code: "zxgcs", title: "咨询工程师"},
#                {code: "wyjl", title: "物业经理/主任/主管"}, {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "tmgc", title: "土木/工程", 
#   categories: [{code: "gjggcs", title: "土建工程师"}, {code: "xsdzgcs", title: "岩土/地质工程师"},
#                {code: "jggcs", title: "结构工程师"}, {code: "zgcs", title: "总工程师/高级工程师"},
#                {code: "slsdgcs", title: "水利水电工程师"}, {code: "gczj", title: "工程总监"},
#                {code: "xcgcs", title: "现场工程师"}, {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "zygcs", title: "专员/工程师", 
#   categories: [{code: "zjygcs", title: "造价员/工程师"}, {code: "pgjg", title: "普工/技工"},
#                {code: "jlygcs", title: "监理员/工程师"}, {code: "zlyaqy", title: "资料员/安全员"},
#                {code: "sgy", title: "施工员"}, {code: "ysy", title: "预算员/工程师"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "jzqt", title: "给排水/暖通", 
#   categories: [{code: "jpsgcs", title: "给排水工程师"}, {code: "ntrlgsc", title: "暖通/热力工程师"},
#                {code: "dqgcs", title: "电气工程师"}, {code: "sngcs", title: "水暖工程师"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "zhgl", title: "综合管理", 
#   categories: [{code: "cw", title: "财务"}, {code: "gcgl", title: "高层管理"},
#                {code: "xzhq", title: "行政后勤/文秘/助理"}, {code: "rlzy", title: "人力资源"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "xssc", title: "销售/市场/营销", 
#   categories: [{code: "dhxs", title: "电话销售"}, {code: "xsdb", title: "销售代表"},
#                {code: "zjjl", title: "总监/经理/主管"}, {code: "sctg", title: "市场推广"},
#                {code: "xszl", title: "销售助理"}, {code: "zyxs", title: "专业营销"},
#                {code: "qt", title: "其他"}])



# segment = Segment.create!(code: "gcxmgl", title: "工程/项目管理", 
#   categories: [{code: "jzs", title: "建造师"}, {code: "xmjl", title: "项目经理"},
#                {code: "xmgl", title: "项目管理"}, {code: "gcs", title: "工程师"},
#                {code: "zrgcs", title: "责任工程师"}, {code: "gz", title: "工长"},
#                {code: "zxpggw", title: "咨询/评估/顾问"}, {code: "jhkzgcs", title: "计划控制工程师"},
#                ])

# segment = Segment.create!(code: "jcsj", title: "建筑设计", 
#   categories: [{code: "jzsjs", title: "建筑师/建筑设计师"}, {code: "zjzs", title: "建筑师/建筑设计师"},
#                {code: "sgtsjs", title: "施工图设计师"}, {code: "fasjs", title: "方案设计师"},
#                {code: "stgcs", title: "审图工程师"}, {code: "qt", title: "其他"}
#                ])

# segment = Segment.create!(code: "szlq", title: "市政/路桥", 
#   categories: [{code: "szgcs", title: "市政工程师"}, {code: "glsdql", title: "公路/隧道/桥梁工程师"},
#                {code: "csghsj", title: "城市/市政规划设计师"}, {code: "qt", title: "其他"}
#                ])

# segment = Segment.create!(code: "jzqt", title: "建筑其他", 
#   categories: [{code: "gjggcs", title: "钢结构工程师"}, {code: "yljgsjs", title: "园林/景观设计师"},
#                {code: "ztbygcs", title: "招投标员/工程师"}, {code: "hjgcs", title: "环境工程师"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "fdczx", title: "房地产/装修", 
#   categories: [{code: "snsjs", title: "室内设计师"}, {code: "zssjs", title: "装饰设计师/工程师"},
#                {code: "fdckf", title: "房地产开发"}, {code: "zxgcs", title: "咨询工程师"},
#                {code: "wyjl", title: "物业经理/主任/主管"}, {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "tmgc", title: "土木/工程", 
#   categories: [{code: "gjggcs", title: "土建工程师"}, {code: "xsdzgcs", title: "岩土/地质工程师"},
#                {code: "jggcs", title: "结构工程师"}, {code: "zgcs", title: "总工程师/高级工程师"},
#                {code: "slsdgcs", title: "水利水电工程师"}, {code: "gczj", title: "工程总监"},
#                {code: "xcgcs", title: "现场工程师"}, {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "zygcs", title: "专员/工程师", 
#   categories: [{code: "zjygcs", title: "造价员/工程师"}, {code: "pgjg", title: "普工/技工"},
#                {code: "jlygcs", title: "监理员/工程师"}, {code: "zlyaqy", title: "资料员/安全员"},
#                {code: "sgy", title: "施工员"}, {code: "ysy", title: "预算员/工程师"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "jzqt", title: "给排水/暖通", 
#   categories: [{code: "jpsgcs", title: "给排水工程师"}, {code: "ntrlgsc", title: "暖通/热力工程师"},
#                {code: "dqgcs", title: "电气工程师"}, {code: "sngcs", title: "水暖工程师"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "zhgl", title: "综合管理", 
#   categories: [{code: "cw", title: "财务"}, {code: "gcgl", title: "高层管理"},
#                {code: "xzhq", title: "行政后勤/文秘/助理"}, {code: "rlzy", title: "人力资源"},
#                {code: "qt", title: "其他"}])

# segment = Segment.create!(code: "xssc", title: "销售/市场/营销", 
#   categories: [{code: "dhxs", title: "电话销售"}, {code: "xsdb", title: "销售代表"},
#                {code: "zjjl", title: "总监/经理/主管"}, {code: "sctg", title: "市场推广"},
#                {code: "xszl", title: "销售助理"}, {code: "zyxs", title: "专业营销"},
#                {code: "qt", title: "其他"}])