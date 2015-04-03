class Order < ActiveRecord::Base
  belongs_to :users
  belongs_to :employees

  @order_lengths = [1, 3, 7]


  def assign_order_to_employee
    employee = LastEmployeeAssignedAnOrder.last
  end

  def self.order_lengths
    @order_lengths
  end
end
