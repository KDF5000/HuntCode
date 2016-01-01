class RemoveXPasswdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :x_passwd, :string
  end
end
