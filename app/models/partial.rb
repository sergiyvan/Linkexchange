class Partial < ActiveRecord::Base
	has_many :partial_known_url
	has_many :known_url, through: :partial_known_url
end
