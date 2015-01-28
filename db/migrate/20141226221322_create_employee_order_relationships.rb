class CreateEmployeeOrderRelationships < ActiveRecord::Migration
  def change
    create_table :employee_order_relationships do |t|
      t.integer :employee_id
      t.integer :order_id

      t.timestamps
    end
  end
end
