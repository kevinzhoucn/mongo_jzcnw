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
SiteConfig.save_default("tips","提示1\n提示2")

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

puts 'DEFAULT USERS'
# user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name

User.delete_all
admin = User.create!(user_name: "admin01", phone_number: "18888888888", password: "password", locate_province: "110000", locate_city: "110100")
admin.add_role :admin
puts 'admin: ' << admin.user_name

admin = User.create!(user_name: "admin02", phone_number: "18899999999", password: "password", locate_province: "110000", locate_city: "110100")
admin.add_role :admin
puts 'admin: ' << admin.user_name

user = User.create!(user_name: "user01", phone_number: "18800000000", password: "password", locate_province: "110000", locate_city: "110100")
puts 'user: ' << user.user_name

user = User.create!(user_name: "user02", phone_number: "18800000001", password: "password", locate_province: "110000", locate_city: "110100")
puts 'user: ' << user.user_name


# 全职招聘部分
Category.delete_all
Segment.delete_all
Record.delete_all
categories = Category.create! ([{code: "jzs", title: "建造师"}, {code: "xmjl", title: "项目经理"},
               {code: "xmgl", title: "项目管理"}, {code: "gcs", title: "工程师"},
               {code: "zrgcs", title: "责任工程师"}, {code: "gz", title: "工长"},
               {code: "zxpggw", title: "咨询/评估/顾问"}, {code: "jhkzgcs", title: "计划控制工程师"},
               ])
segment = Segment.create!(code: "gcxmgl", title: "工程/项目管理")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "szgcs", title: "市政工程师"}, {code: "glsdql", title: "公路/隧道/桥梁工程师"},
               {code: "csghsj", title: "城市/市政规划设计师"}, {code: "qt", title: "其他"}
               ])
segment = Segment.create!(code: "szlq", title: "市政/路桥")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "gjggcs", title: "钢结构工程师"}, {code: "yljgsjs", title: "园林/景观设计师"},
               {code: "ztbygcs", title: "招投标员/工程师"}, {code: "hjgcs", title: "环境工程师"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "jzqt", title: "建筑其他")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "snsjs", title: "室内设计师"}, {code: "zssjs", title: "装饰设计师/工程师"},
               {code: "fdckf", title: "房地产开发"}, {code: "zxgcs", title: "咨询工程师"},
               {code: "wyjl", title: "物业经理/主任/主管"}, {code: "qt", title: "其他"}])
segment = Segment.create!(code: "fdczx", title: "房地产/装修",  categories: categories)
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "gjggcs", title: "土建工程师"}, {code: "xsdzgcs", title: "岩土/地质工程师"},
               {code: "jggcs", title: "结构工程师"}, {code: "zgcs", title: "总工程师/高级工程师"},
               {code: "slsdgcs", title: "水利水电工程师"}, {code: "gczj", title: "工程总监"},
               {code: "xcgcs", title: "现场工程师"}, {code: "qt", title: "其他"}])
segment = Segment.create!(code: "tmgc", title: "土木/工程")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "zjygcs", title: "造价员/工程师"}, {code: "pgjg", title: "普工/技工"},
               {code: "jlygcs", title: "监理员/工程师"}, {code: "zlyaqy", title: "资料员/安全员"},
               {code: "sgy", title: "施工员"}, {code: "ysy", title: "预算员/工程师"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "zygcs", title: "专员/工程师")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jpsgcs", title: "给排水工程师"}, {code: "ntrlgsc", title: "暖通/热力工程师"},
               {code: "dqgcs", title: "电气工程师"}, {code: "sngcs", title: "水暖工程师"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "jzqt", title: "给排水/暖通")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "cw", title: "财务"}, {code: "gcgl", title: "高层管理"},
               {code: "xzhq", title: "行政后勤/文秘/助理"}, {code: "rlzy", title: "人力资源"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "zhgl", title: "综合管理")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "dhxs", title: "电话销售"}, {code: "xsdb", title: "销售代表"},
               {code: "zjjl", title: "总监/经理/主管"}, {code: "sctg", title: "市场推广"},
               {code: "xszl", title: "销售助理"}, {code: "zyxs", title: "专业营销"},
               {code: "qt", title: "其他"}])
segment = Segment.create!(code: "xssc", title: "销售/市场/营销")
segment.for = "qz"
segment.save
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jzgc", title: "建筑工程"}, {code: "szgy", title: "市政公用"},
               {code: "jdgc", title: "机电工程"}, {code: "slsd", title: "水利水电"},
               {code: "glgc", title: "公路工程"}, {code: "kygc", title: "矿业工程"},
               {code: "txygd", title: "通信与广电"}, {code: "gkhd", title: "港口与航道"},
               {code: "tlgc", title: "铁路工程"}, {code: "mhjc", title: "民航机场"}])
segment = Segment.create!(code: "yjgcs", title: "一级建造师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jzgc", title: "建筑工程"}, {code: "jdgc", title: "机电工程"},
               {code: "szgygc", title: "市政公用工程"}, {code: "slsdgc", title: "水利水电工程"},
               {code: "glgc", title: "公路工程"}, {code: "kygc", title: "矿业工程"}])
segment = Segment.create!(code: "ejjzs", title: "二级建造师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jsb", title: "建设部"}, {code: "slb", title: "水利部"},
               {code: "jtb", title: "交通部"}])
segment = Segment.create!(code: "zjs", title: "造价师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "yjjgs", title: "一级结构师"}, {code: "ejjgs", title: "二级结构师"}])
segment = Segment.create!(code: "jgs", title: "结构师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "jsb", title: "建设部"}, {code: "slb", title: "水利部"},
               {code: "jtb", title: "交通部"}])
segment = Segment.create!(code: "jls", title: "监理师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "gpd", title: "供配电"}, {code: "fsbd", title: "发输变电"}])
segment = Segment.create!(code: "dqgcs", title: "电气工程师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "ntkt", title: "暖通空调"}, {code: "jsps", title: "给水排水"},
               {code: "dl", title: "动力"}])
segment = Segment.create!(code: "gysbgcs", title: "公用设备工程师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "hjgchstjs", title: "环境工程和生态建设"}, {code: "szgygc", title: "市政公用工程"}])
segment = Segment.create!(code: "zczxs", title: "注册咨询师", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "csghs", title: "城市规划师"}, {code: "hpgcs", title: "环评工程师"},
               {code: "fdcgjs", title: "房地产估价师"}])
segment = Segment.create!(code: "qtzs", title: "其他证书", categories: categories, for: "zs")
categories.each do | cat |
     cat.segment = segment
     cat.save
end

categories = Category.create! ([{code: "zcbzzbl", title: "总承包资质办理"}, {code: "yllhzzdb", title: "园林绿化资质代办"},
               {code: "sjsgythzz", title: "施工专业承包资质"}, {code: "yllhzzdb", title: "设计施工一体化资质"},
               {code: "yllhzzdb", title: "代办劳务分包资质"},{code: "sjsgythzz", title: "代办企业资质"},
               {code: "yllhzzdb", title: "建筑企业资质办理"}])
segment = Segment.create!(code: "zzdb", title: "资质代办", categories: categories, for: "db")
categories.each do | cat |
     cat.segment = segment
     cat.save
end
