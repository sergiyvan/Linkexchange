class CustomerPartial < ActiveRecord::Base
	belongs_to :customer
	belongs_to :partial
end
