class Thirdparty < ActiveRecord::Migration
  def change
    create_table :thirdparty do |t|
      t.string :identifier
      t.belongs_to :user, index:true
      t.integer :type

      t.timestamps null: false
    end
  end
end
