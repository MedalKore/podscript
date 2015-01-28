class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :order_number
      t.string :podcast_location
      t.string :podcast_title
      t.string :podcast_subject
      t.string :order_of_appearance
      t.string :transcript
      t.timestamp :completed

      t.timestamps
    end
  end
end
