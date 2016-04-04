**HuntCode**, 高级软件工程练习项目
演示地址: [http://huntcode.herokuapp.com/](http://huntcode.herokuapp.com/)

# 系统框架搭建
```zsh
rails new HuntCode
# 主页
rails g controller welcome index
# 修改路由
vim config/routes.rb
rails routes

# rails g controller project
# rails g controller user
# rails g scaffold Project name:string info:text url:string
# rails g model User x_id:string x_username:string x_passwd:string x_email:string x_projects:references

# 使用scaffold脚手架来生成动态的页面内容
rails g scaffold Project name:string info:text url:string
rails g scaffold User x_id:string x_username:string x_passwd:string x_email:string x_projects:references

# 安装gem
bundle install --without production # 不安装生产环境所需的gem
```

## 各文件夹的意义

文件夹 | 用途
------|------
app/ | 应用的核心文件，包含模型、视图、控制器和辅助方法
app/assets | 应用的资源文件，例如层叠样式表（CSS）、JavaScript 和图片
bin/ | 可执行二进制文件
config/ | 应用的配置
db/ | 数据库相关的文件
doc/ | 应用的文档
lib/ | 代码库模块文件
lib/assets | 代码库的资源文件，例如 CSS、JavaScript 和图片
log/ | 应用的日志文件
public/ | 公共（例如浏览器）可访问的文件，例如错误页面
bin/rails | 生成代码、打开终端会话或启动本地服务器的程序
test/ | 应用的测试
tmp/ | 临时文件
vendor/ | 第三方代码，例如插件和 gem
vendor/assets | 第三方资源文件，例如 CSS、JavaScript 和图片
README.md | 应用简介
Rakefile | 使用 rake 命令执行的实用任务
Gemfile | 应用所需的 gem
Gemfile.lock | gem 列表，确保这个应用的副本使用相同版本的 gem
config.ru | Rack 中间件的配置文件
.gitignore | Git 忽略的文件

# 数据库设计

## 项目
字段名 | 类型 | 简介 
----|------|------
name | string | 项目名称
info | text | 项目简介
url | string | 项目地址
rating | float | 项目评级

## 用户
字段名 | 类型 | 简介
-----|------|-----
x_id | string | 用户ID
x_name | string | 用户名
x_email | string | 用户邮箱
x_passwd | string | 用户密码，需要加密
x_projects | references | 用户收藏的项目，是project的外键

# 视图
javacrpit 和 css 文件放入 `public` 文件夹，页面(模版)文件放入 `app/views/`下的各个子目录下。
