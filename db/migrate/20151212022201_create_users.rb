class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :x_id
      t.string :x_username
      t.string :x_passwd
      t.string :x_email
      t.references :x_projects, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
