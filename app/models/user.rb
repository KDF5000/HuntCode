class User < ActiveRecord::Base
    has_many :project
    validates :x_name, length: { maximun: 127 }, presence: true
end
