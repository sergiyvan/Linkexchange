class PartialKnownUrl < ActiveRecord::Base
	belongs_to :partial
	belongs_to :known_url
end
