# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

projects = [{:title=>"OpenAuth.Net",:language=>".Net",:intro_content=>"项目采用经典DDD架构(用沃恩.弗农大神的话，其实这是DDD-Lite）思想进行开发，简洁而不简单，实用至上，并且所写每一行代码都经过深思熟虑，符合SOLID规则！",:user_id=>1,:source_url=>"http://git.oschina.net/yubaolee/OpenAuth.Net"},
            {:title=>"zookeeper-web",:language=>"Python",:intro_content=>"ookeeper-web是一个简单的、方便的zookeeper管理工具",:user_id=>1,:source_url=>"http://git.oschina.net/crystony/zookeeper-web"},
            {:title=>"jfire-codejson",:language=>"Java",:intro_content=>"最好的json框架，拥有最快的序列化和反序列化速度（序列化速度是fastjson的2倍，反序列化较fastjson提高13%）。拥有所有json框架都不具备的策略能力，可以在依靠不同的策略将同一个策略序列化输出两种不同的字符串",:user_id=>1,:source_url=>"http://git.oschina.net/eric_ds/jfire-codejson"},
            {:title=>"thinker-md",:language=>"Javascript",:intro_content=>"最好用的md编辑器，支持Markdown标准,极致的编辑体验，支持草稿保存，全屏编辑。",:user_id=>1,:source_url=>"http://git.oschina.net/benhail/thinker-md"},
            {:title=>"memcached.distributedSession",:language=>"Java",:intro_content=>"基于MemCached的session共享插件，可以使得应用服务器集群通过Memcached集群共享session。目前支持Tomcat6以上版本",:user_id=>2,:source_url=>"http://git.oschina.net/ufo5260987423/memcached.distributedSession"},
            {:title=>"Dyd.BaseService.Monitor",:language=>".Net",:intro_content=>".net 简单统一监控平台，用于集群的性能监控,应用耗时监控管理，统一日志管理等多维度的性能监控分析。",:user_id=>1,:source_url=>"http://git.oschina.net/chejiangyi/Dyd.BaseService.Monitor"},
            {:title=>"andmobi-search",:language=>"",:intro_content=>"基于lucene的轻量级面向对象分布式搜索引擎，提供面向对象的Lucene-API，支持高亮功能 3.简化Lucene分页 4.支持分组统计功能",:user_id=>2,:source_url=>"http://git.oschina.net/zhaojunfu2014/andmobi-search"},
            {:title=>"Mycat-Server",:language=>"Java",:intro_content=>"MyCAT 是一个彻底开源的，面向企业应用开发的大数据库集群，支持事务、ACID、可以替代MySQL的加强版数据库。一个可以视为MySQL集群的企业级数据库。",:user_id=>2,:source_url=>"http://git.oschina.net/linzhiqiang/Mycat-Server"},
            {:title=>"SwitchyOmega",:language=>"Javascript",:intro_content=>"SwitchyOmega 是 SwitchySharp 的新版本。这是一个 Chrome 浏览器用来切换不同代理的插件。SwitchyOmega 初次安装时会检查是否存在 SwitchySharp ，如果有的话则会自动升级设置，无须手动配置。如果您使用的是非谷歌应用商店版，或者无法自动升级，则可以手动在SwitchySharp导出设置文件 后，在SwitchyOmega导入，可兼容配置。升级到SwitchyOmega后请禁用SwitchySharp",:user_id=>2,:source_url=>"https://github.com/FelisCatus/SwitchyOmega"},
            {:title=>"React Native",:language=>"Javascript",:intro_content=>"ReactNative 可以基于目前大热的开源JavaScript库React.js来开发iOS和Android原生App。而且React Native已经用于生产环境——Facebook Groups iOS 应用就是基于它开发的。",:user_id=>2,:source_url=>"http://www.reactnative.com/"},
            {:title=>"EasyPR",:language=>"C++",:intro_content=>"EasyPR是一个中文的开源车牌识别系统，其目标是成为一个简单、灵活、准确的车牌识别引擎。",:user_id=>1,:source_url=>"http://git.oschina.net/easypr/EasyPR"},
            {:title=>"Editor.md",:language=>"Javascript",:intro_content=>"Editor.md 是一个可嵌入的开源 Markdown 在线编辑器组件，你可以很方便用在浏览器、NW.js（Node-webkit）等地方，基于CodeMirror、jQuery 和 Marked 构建。",:user_id=>1,:source_url=>"https://pandao.github.io/editor.md/"},
            {:title=>"Let's Chat",:language=>"Javascript",:intro_content=>"Let's Chat 是一个类似 Slack 的团队聊天软件，基于 Node.js 和 MongoDB 开发，易于发布，适合中小型团队，支持 LDAP/Kerberos 认证，提供 REST 风格 API 和 XMPP 支持。",:user_id=>1,:source_url=>"https://sdelements.github.io/lets-chat/"},
            {:title=>"Open-Falcon",:language=>"Javacscipt",:intro_content=>"Open-Falcon 是小米运维部开源的一款互联网企业级监控系统解决方案.",:user_id=>1,:source_url=>"http://open-falcon.com/"},
            {:title=>"Eclipse Che",:language=>"Java",:intro_content=>"Eclipse Che 是一个高性能的基于浏览器的集成开发环境，通过提供结构化的工作区、项目输入、模块化扩展插件来支持 Codenvy 的引擎。",:user_id=>1,:source_url=>"https://eclipse.org/che/"},
            {:title=>"ECharts-X",:language=>"Javascript",:intro_content=>"ECharts-X是 ECharts 团队推出的全新 3D 可视化库，它是基于 ECharts 的扩展，底层深度整合了 WebGL 库QTEK和 Canvas2D 库ZRender。",:user_id=>1,:source_url=>"https://github.com/ecomfe/echarts-x"},
            {:title=>"pycharm",:intro_content=>"python ide",:language=>"Python", :user_id =>1 ,:source_url=>"https://www.jetbrains.com/pycharm/download/"},
            {:title=>"rubymine",:intro_content=>"ruby ide",:language=>"Ruby", :user_id=>2,:source_url=>"https://www.jetbrains.com/ruby/"},
            {:title=>"Redis的可视化工具 Medis ",:language=>"nodejs", :intro_content=>"Medis 是 Mac 系统上一个一款界面很漂亮，而且易于使用的 Redis 数据库管理工具。基于 Electron, React, 和 Redux 平台构建，由很多很棒的 Node.js 模块所组成，特别是 ioredis 和 ssh2.",:user_id=>2,:source_url=>"https://github.com/luin/medis"},
            {:title=>"DebOps",:language=>"Python",:intro_content=>"DebOps基于Debian的数据中心，是Ansible方案的集合，可以任意从一个容器伸缩到整个条目数据中心",:user_id=>1,:source_url=>"https://github.com/debops/debops"},
            {:title=>"Docker",:language=>"Go", :intro_content=>"Docker是一个开源的应用容器引擎，让开发者可以打包其应用以及依赖包到一个可移植的容器中，然后发布到任意Linux发行版，也可实现虚拟化",:user_id=>1,:source_url=>"https://www.docker.io"},
            {:title=>"InfluxDB",:language=>"Go",:intro_content=>"InfluxDB是一个开源分布式的时序、事件和指标数据库。InfluxDB使用Go语音编写，无需外部依赖。其设计目标是实现分布式和水平伸缩扩展。",:user_id=>2,:source_url=>"http://influxdb.org/"},
            {:title=>"OpenDaylight",:language=>"Java",:intro_content=>"OpenDaylight是一套以社区为主导的开源框架，旨在推动创新实施以及软件定义网络SDN的透明化。面对新潮的SDN网络，大家需要合适的工具帮助自己管理基础设施",:user_id=>1,:source_url=>"http://www.opendaylight.org/"},
            {:title=>"light-task-scheduler",:language=>"Java",:intro_content=>"LTS(light-task-scheduler)主要用于解决分布式任务调度问题，支持实时任务，定时任务和Cron任务。有较好的伸缩性，扩展性，健壮稳定性而被多家公司使用，同时也希望开源爱好者一起贡献",:user_id=>2,:source_url=>"https://github.com/qq254963746/light-task-scheduler"},
            ]

 # users = [{:x_username=>"jinjay",:x_passwd=>"123456",:x_email=>"jinjay@qq.com",:x_projects_id=>1},
 #         {:x_username=>"qy",:x_passwd=>"123456",:x_email=>"qy@qq.com",:x_projects_id=>2}]

users = [{:x_username=>"admin",:x_email=>"admin@123.com",:password=> "123456",:password_confirmation=>"123456",:admin=>true}]
stars = [{:user_id=>1,:project_id=>1},{:user_id=>2,:project_id=>2}]

projects.each do |project|
  Project.create!(project)
end

stars.each do |star|
  Star.create!(star)
end
users.each do |user|
  User.create!(user)
end