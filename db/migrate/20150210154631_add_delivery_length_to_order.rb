class AddDeliveryLengthToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_length, :string
  end
end
