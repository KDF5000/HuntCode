class Project < ActiveRecord::Base
    # 限制项目名称的长度
    validates :name, length: { maximun: 127 }, presence: true
end
