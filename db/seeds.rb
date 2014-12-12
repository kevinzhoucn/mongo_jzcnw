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

# 默认配置项
# 如需新增设置项，请在这里初始化默认值，然后到后台修改
# 首页
# SiteConfig.index_html
SiteConfig.delete_all
SiteConfig.save_default("index_html",<<-eos
<div class="box" style="text-align:center;">
  <p><img alt="Big_logo" src="/assets/big_logo.png"></p>
  <p></p>
  <p>Ruby China Group， 致力于构建完善的 Ruby 中文社区。</p>
  <p>功能正在完善中，欢迎 <a href="http://github.com/huacnlee/ruby-china">贡献代码</a> 。</p>
  <p>诚邀有激情的活跃 Ruby 爱好者参与维护社区，联系 <b style="color:#c00;">lgn21st@gmail.com</b></p>
</div>
eos
)

# Wiki 首页 HTML
SiteConfig.save_default("wiki_index_html",<<-eos
<div class="box">
  Wiki Home page.
</div>
eos
)

# Footer HTML
SiteConfig.save_default("footer_html",<<-eos
<p class="copyright">
 &copy; Ruby China Group.
</p>
eos
)

# 话题后面的HTML代码
SiteConfig.save_default("after_topic_html",<<-eos
<div class="share_links">
 <a href="https://twitter.com/share" class="twitter-share-button" data-count="none"">Tweet</a>
 <script type="text/javascript" src="//platform.twitter.com/widgets.js"></script>
</div>
eos
)

# 话题正文前面的HTML
SiteConfig.save_default("before_topic_html",<<-eos
eos
)

# 话题列表首页边栏HTML
SiteConfig.save_default("topic_index_sidebar_html",<<-eos
<div class="box">
  <h2>公告</h2>
  <div class="content">
    Hello world.
  </div>
</div>

<div class="box">
  <h2>置顶话题</h2>
  <ul class="content">
    <li><a href="/topics/1">Foo bar</a></li>
  </ul>
</div>
eos
)

# 酷站列表首页头的HTML
SiteConfig.save_default("site_index_html",<<-eos
下面列出了基于 Ruby 语言开发的网站。如果你知道还有不在此列表的，请帮忙补充。
eos
)

# 自定有 HTML head 区域的内容
SiteConfig.save_default("custom_head_html",<<-eos
<link rel="dns-prefetch" href="//assets.youhost.com">
eos
)

# 要在论坛首页列表隐藏的节点,以逗号隔开
SiteConfig.save_default("node_ids_hide_in_topics_index","")

# Sidebar 新建话题按钮，下拉显示的节点列表
SiteConfig.save_default("new_topic_dropdown_node_ids","")

# 禁止回复的某些词语
SiteConfig.save_default("ban_words_on_reply","mark\n收藏\n顶\n赞\nup\n")

# 随机显示的 tip 信息
SiteConfig.save_default("tips","可以收藏信息哦&&可以评论信息")

SiteConfig.save_default("newbie_notices",%(<p>为提高社区质量，防止新人一来就发帖提问接触 Ruby 遇到的问题，新用户需要达到下面条件才可发帖：</p>
    <ol style="color:#ad2b2d;">
      <li>注册时间超过一个月；</li>
      <li>回帖数量必须达到 10 帖以上；</li>
    </ol>
    <p>请在新人阶段多浏览，看看其他老用户是如何在社区里面分享与解决问题的。</p>))

SiteConfig.save_default("reject_newbie_reply_in_the_evening", "false")

SiteConfig.save_default("twitter_page_html",%(
<div class="box">
<a class="twitter-timeline" href="https://twitter.com/ruby_china/ruby-developers" data-widget-id="435676008880959489" data-tweet-limit="20" data-chrome="noscrollbar transparent" width="940" height="800">Ruby Developers 的 Twitter Timeline</a>
<script type="text/javasscript">!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</div>
))

#-----------------------------------------
# User Segment Category section

# puts 'DEFAULT USERS'
# # user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# # puts 'user: ' << user.name

# User.delete_all
# admin = User.create!(user_name: "admin01", phone_number: "18888888888", password: "password", locate_province: "110000", locate_city: "110100")
# admin.add_role :admin
# puts 'admin: ' << admin.user_name

# admin = User.create!(user_name: "admin02", phone_number: "18899999999", password: "password", locate_province: "110000", locate_city: "110100")
# admin.add_role :admin
# puts 'admin: ' << admin.user_name

# user = User.create!(user_name: "user01", phone_number: "18800000000", password: "password", locate_province: "110000", locate_city: "110100")
# puts 'user: ' << user.user_name

# user = User.create!(user_name: "user02", phone_number: "18800000001", password: "password", locate_province: "110000", locate_city: "110100")
# puts 'user: ' << user.user_name


# 全职招聘部分
Category.delete_all
Segment.delete_all
Record.delete_all
Qualify.delete_all
categories = Category.create! ([{code: "jzs", title: "建造师", top: 1}, {code: "xmjl", title: "项目经理", top: 2},
               {code: "xmgl", title: "项目管理", top: 3}, {code: "gcs", title: "工程师", top: 4},
               {code: "zrgcs", title: "责任工程师", top: 5}, {code: "gz", title: "工长", top: 6},
               {code: "zxpggw", title: "咨询/评估/顾问", top: 7}, {code: "jhkzgcs", title: "计划控制工程师", top: 8},
               ])
segment = Segment.create!(code: "gcxmgl", title: "工程/项目管理", top: 1)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "szgcs", title: "市政工程师", top: 1}, {code: "glsdql", title: "公路/隧道/桥梁工程师", top: 2},
               {code: "csghsj", title: "城市/市政规划设计师", top: 3}, {code: "qt", title: "其他", top: 4}
               ])
segment = Segment.create!(code: "szlq", title: "市政/路桥", top: 2)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "gjggcs", title: "钢结构工程师", top: 1}, {code: "yljgsjs", title: "园林/景观设计师", top: 2},
               {code: "ztbygcs", title: "招投标员/工程师", top: 3}, {code: "hjgcs", title: "环境工程师", top: 4},
               {code: "qt", title: "其他", top: 5}])
segment = Segment.create!(code: "jzqt", title: "建筑其他", top: 3)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "snsjs", title: "室内设计师", top: 1}, {code: "zssjs", title: "装饰设计师/工程师", top: 2},
               {code: "fdckf", title: "房地产开发", top: 3}, {code: "zxgcs", title: "咨询工程师", top: 4},
               {code: "wyjl", title: "物业经理/主任/主管", top: 5}, {code: "qt", title: "其他", top: 6}])
segment = Segment.create!(code: "fdczx", title: "房地产/装修",  categories: categories, top: 4)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "gjggcs", title: "土建工程师", top: 1}, {code: "xsdzgcs", title: "岩土/地质工程师", top: 2},
               {code: "jggcs", title: "结构工程师", top: 3}, {code: "zgcs", title: "总工程师/高级工程师", top: 4},
               {code: "slsdgcs", title: "水利水电工程师", top: 5}, {code: "gczj", title: "工程总监", top: 6},
               {code: "xcgcs", title: "现场工程师", top: 7}, {code: "qt", title: "其他", top: 8}])
segment = Segment.create!(code: "tmgc", title: "土木/工程", top: 5)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "zjygcs", title: "造价员/工程师", top: 1}, {code: "pgjg", title: "普工/技工", top: 2},
               {code: "jlygcs", title: "监理员/工程师", top: 3}, {code: "zlyaqy", title: "资料员/安全员", top: 4},
               {code: "sgy", title: "施工员", top: 5}, {code: "ysy", title: "预算员/工程师", top: 6},
               {code: "qt", title: "其他", top: 7}])
segment = Segment.create!(code: "zygcs", title: "专员/工程师", top: 6)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jpsgcs", title: "给排水工程师", top: 1}, {code: "ntrlgsc", title: "暖通/热力工程师", top: 2},
               {code: "dqgcs", title: "电气工程师", top: 3}, {code: "sngcs", title: "水暖工程师", top: 4},
               {code: "qt", title: "其他", top: 5}])
segment = Segment.create!(code: "jzqt", title: "给排水/暖通", top: 7)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "cw", title: "财务", top: 1}, {code: "gcgl", title: "高层管理", top: 2},
               {code: "xzhq", title: "行政后勤/文秘/助理", top: 3}, {code: "rlzy", title: "人力资源", top: 4},
               {code: "qt", title: "其他", top: 5}])
segment = Segment.create!(code: "zhgl", title: "综合管理", top: 8)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "dhxs", title: "电话销售", top: 1}, {code: "xsdb", title: "销售代表", top: 2},
               {code: "zjjl", title: "总监/经理/主管", top: 3}, {code: "sctg", title: "市场推广", top: 4},
               {code: "xszl", title: "销售助理", top: 5}, {code: "zyxs", title: "专业营销", top: 6},
               {code: "qt", title: "其他", top: 7}])
segment = Segment.create!(code: "xssc", title: "销售/市场/营销", top: 9)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jzgc", title: "建筑工程", top: 1}, {code: "szgy", title: "市政公用", top: 2},
               {code: "jdgc", title: "机电工程", top: 3}, {code: "slsd", title: "水利水电", top: 4},
               {code: "glgc", title: "公路工程", top: 5}, {code: "kygc", title: "矿业工程", top: 6},
               {code: "txygd", title: "通信与广电", top: 7}, {code: "gkhd", title: "港口与航道", top: 8},
               {code: "tlgc", title: "铁路工程", top: 9}, {code: "mhjc", title: "民航机场", top: 10}])
segment = Segment.create!(code: "yjgcs", title: "一级建造师", categories: categories, for: "zs", top: 1)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jzgc", title: "建筑工程", top: 1}, {code: "jdgc", title: "机电工程", top: 2},
               {code: "szgygc", title: "市政公用工程", top: 3}, {code: "slsdgc", title: "水利水电工程", top: 4},
               {code: "glgc", title: "公路工程", top: 5}, {code: "kygc", title: "矿业工程", top: 6}])
segment = Segment.create!(code: "ejjzs", title: "二级建造师", categories: categories, for: "zs", top: 2)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jsb", title: "建设部", top: 1}, {code: "slb", title: "水利部", top: 2},
               {code: "jtb", title: "交通部", top: 3}])
segment = Segment.create!(code: "zjs", title: "造价师", categories: categories, for: "zs", top: 3)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "yjjgs", title: "一级结构师", top: 1}, {code: "ejjgs", title: "二级结构师", top: 2}])
segment = Segment.create!(code: "jgs", title: "结构师", categories: categories, for: "zs", top: 4)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jsb", title: "建设部", top: 1}, {code: "slb", title: "水利部", top: 2},
               {code: "jtb", title: "交通部", top: 3}])
segment = Segment.create!(code: "jls", title: "监理师", categories: categories, for: "zs", top: 5)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "gpd", title: "供配电", top: 1}, {code: "fsbd", title: "发输变电", top: 2}])
segment = Segment.create!(code: "dqgcs", title: "电气工程师", categories: categories, for: "zs", top: 6)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "ntkt", title: "暖通空调", top: 1}, {code: "jsps", title: "给水排水", top: 2},
               {code: "dl", title: "动力"}])
segment = Segment.create!(code: "gysbgcs", title: "公用设备工程师", categories: categories, for: "zs", top: 7)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "hjgchstjs", title: "环境工程和生态建设", top: 1}, {code: "szgygc", title: "市政公用工程", top: 2}])
segment = Segment.create!(code: "zczxs", title: "注册咨询师", categories: categories, for: "zs", top: 8)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "csghs", title: "城市规划师", top: 1}, {code: "hpgcs", title: "环评工程师", top: 2},
               {code: "fdcgjs", title: "房地产估价师", top: 3}])
segment = Segment.create!(code: "qtzs", title: "其他证书", categories: categories, for: "zs", top: 9)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

# categories = Category.create! ([{code: "zcbzzbl", title: "总承包资质"}, {code: "zycbzz", title: "专业承包资质"},
#           {code: "lwfbzz", title: "劳务分包资质"}, {code: "yllhzzdb", title: "安全生产许可证"},
#                {code: "sjsgythzz", title: "房地产开发资质"}, {code: "yllhzzdb", title: "园林绿化资质"},
#                {code: "yllhzzdb", title: "工程设计资质"},{code: "sjsgythzz", title: "监理资质"},
#                {code: "yllhzzdb", title: "勘察资质"}, {code: "yllhzzdb", title: "工程造价"},
#                {code: "yllhzzdb", title: "招标代理"}, {code: "yllhzzdb", title: "其它资质"}])
# segment = Segment.create!(code: "zzdb", title: "资质代办", for: "db")
# categories.each do | cat |
#      cat.segment = segment
#      cat.save
# end

categories = Category.create! ([{code: "jzzz", title: "建筑资质", top: 1}, {code: "jdzz", title: "机电资质", top: 2},
               {code: "szzz", title: "市政资质", top: 3}, {code: "dlzz", title: "电力资质", top: 4},
               {code: "kszz", title: "矿山资质", top: 5}, {code: "slsdzz", title: "水利水电资质", top: 6},
               {code: "slsdzz", title: "其它", top: 7}])
segment = Segment.create!(code: "zcbzz", title: "总承包资质", for: "zz", top: 1)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "zszxzz", title: "装饰装修资质", top: 1}, {code: "mqzz", title: "幕墙资质", top: 2},
               {code: "gjgzz", title: "钢结构资质", top: 3}, {code: "jdzz", title: "机电资质", top: 4},
               {code: "fszz", title: "防水资质", top: 5},{code: "dzznh", title: "电子与智能化资质", top: 6}
               ])
segment = Segment.create!(code: "zycbzz", title: "专业承包资质", for: "zz", top: 2)
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([])
segment = Segment.create!(code: "lwfb", title: "劳务分包资质", for: "zz", top: 3)

categories = Category.create! ([])
segment = Segment.create!(code: "aqsc", title: "安全生产许可证", for: "zz", top: 4)

categories = Category.create! ([])
segment = Segment.create!(code: "fdckf", title: "房地产开发资质", for: "zz", top: 5)

categories = Category.create! ([])
segment = Segment.create!(code: "yllh", title: "园林绿化资质", for: "zz", top: 6)

categories = Category.create! ([])
segment = Segment.create!(code: "gcsj", title: "工程设计资质", for: "zz", top: 7)

categories = Category.create! ([])
segment = Segment.create!(code: "jl", title: "监理资质", for: "zz", top: 8)

categories = Category.create! ([])
segment = Segment.create!(code: "kc", title: "勘察资质", for: "zz", top: 9)

categories = Category.create! ([])
segment = Segment.create!(code: "zbdl", title: "招标代理", for: "zz", top: 10)

categories = Category.create! ([])
segment = Segment.create!(code: "qt", title: "其它资质", for: "zz", top: 11)