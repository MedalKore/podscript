class Employee < ActiveRecord::Base
	has_many :orders, through: :employee_order_relationship

end
