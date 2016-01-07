class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :sub_email
      t.integer :status
      t.timestamps null: false

    end
  end
end
