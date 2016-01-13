class Project < ActiveRecord::Base
    # 限制项目名称的长度
    # validates :name, length: { maximun: 127 }, presence: true

  has_many :stars
  has_many :comments
  has_many :users, :through => :stars
  has_many :users, :through => :comments
  belongs_to :user

  VALID_URL_REGEX = /http(s)?:\/\/([^\/]+)/
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  validates :source_url, presence: true,
            format: { with: VALID_URL_REGEX }
end
