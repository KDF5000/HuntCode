class RemoveXIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :x_id, :string
  end
end
