class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.belongs_to :users, index: true
      t.belongs_to :projects, index: true
      t.timestamps null: false
    end
  end
end
