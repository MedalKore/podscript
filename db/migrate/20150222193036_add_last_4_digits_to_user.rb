class AddLast4DigitsToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_4, :integer
  end
end
