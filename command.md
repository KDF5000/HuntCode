
```zsh
rails new HuntCode
rails g controller welcome index

vim config/routes.rb
rails routes

# rails g controller project
# rails g controller user
# rails g scaffold Project name:string info:text url:string
# rails g model User x_id:string x_username:string x_passwd:string x_email:string x_projects:references

rails g scaffold Project name:string info:text url:string
rails g scaffold User x_id:string x_username:string x_passwd:string x_email:string x_projects:references

bundle install --without production # 不安装生产环境所需的gem
```

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
