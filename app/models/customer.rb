class Customer < ActiveRecord::Base
	has_many :customer_categories
	has_many :category, through: :customer_categories
	has_many :known_urls
	has_many :partials, through: :known_urls

	before_save :set_seo_params
	before_create :set_access_key
	
	
	private
		def set_seo_params
			self.google_pr = SeoParams.pr(self.webadress) || -1
			self.yandex_tic = SeoParams.tic(self.webadress) || -1
		end
		
		def set_access_key
			self.access_key = SecureRandom.uuid
		end
end
