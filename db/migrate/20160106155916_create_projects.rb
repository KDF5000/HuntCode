class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :intro_content
      t.belongs_to :users, index:true
      t.string :source_url
      t.integer :status
      t.timestamps null: false
    end
  end
end

