class CreateLastEmployeeAssignedAnOrder < ActiveRecord::Migration
  def change
    create_table :last_employee_assigned_an_orders do |t|
      t.integer :employee_id

      t.timestamps
    end
  end
end
