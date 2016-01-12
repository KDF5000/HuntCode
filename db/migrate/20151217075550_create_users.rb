class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :x_username
      t.string :x_email
      t.string :password_digest
      t.boolean :admin
      t.string :remember_token
      t.string :avatar
      t.timestamps null: false
    end
    add_index :users, :remember_token
  end
end
