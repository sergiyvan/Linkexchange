class Customer < ActiveRecord::Base
	before_save :set_seo_params
	before_create :set_access_key
	
	
	private
		def set_seo_params
			self.google_pr = SeoParams.pr(self.webadress)
			self.yandex_tic = SeoParams.tic(self.webadress)
		end
		
		def set_access_key
			self.access_key = SecureRandom.uuid
		end
end