class KnownUrl < ActiveRecord::Base
	belongs_to :customer
	has_one :partial_known_url
	has_one :partial, through: :known_url
end
