class AddLast4ToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :last_4, :integer
  end
end
