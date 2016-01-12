class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :user_id, index:true
      t.integer :project_id,index:true

      t.timestamps null: false
    end
  end
end
