class Order < ActiveRecord::Base
	belongs_to :users
	belongs_to :employees




	def assign_order_to_employee
		employee = LastEmployeeAssignedAnOrder.last
	end
end
