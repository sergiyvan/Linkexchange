class Category < ActiveRecord::Base
	has_many :customer_category
	has_many :customer, through: :customer_category
end
