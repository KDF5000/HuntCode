class Project < ActiveRecord::Base
    # 限制项目名称的长度
    # validates :name, length: { maximun: 127 }, presence: true

  has_many :stars
  has_many :users, :through => :stars
  belongs_to :user
end
