class CreateThirdparties < ActiveRecord::Migration
  def change
    create_table :thirdparties do |t|
      t.string :identifier
      t.integer :user_id,index:true
      t.integer :type
      t.timestamps null: false
    end
  end
end
