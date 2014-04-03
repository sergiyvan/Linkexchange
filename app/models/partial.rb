class Partial < ActiveRecord::Base
	has_many :partial_known_urls
	has_many :known_urls, through: :partial_known_urls
	has_many :customer_partials
	has_many :customers, through: :customer_partials

	def self.generate_random_partial
		partial_sets = Partial.all.map(&:customer_ids).to_s.gsub('[', '(').gsub(']', ')')
		permutations = ["c1.id","c2.id","c3.id"].permutation.to_a
		where = ""
		if Partial.exists?
			where << " WHERE "
			permutations.each do |perm|
				where << "(" + perm.join(",") + ")" + "NOT IN #{partial_sets} "
				where << " AND " unless perm==permutations.last
			end
		end
		sql_query = "SELECT c1.id, c2.id, c3.id 
					FROM `customers` as c1, 
					`customers` as c2, 
					`customers` as c3 
					#{where} ORDER BY RAND() LIMIT 1"
		ActiveRecord::Base.connection.execute(sql_query)
		customers = Customer.order("RAND()").first(3)
		partial_html = "<div class='le_partial'>"
		customers.each do |customer|
			partial_html << "<a href='http://#{customer.webadress}'>#{customer.name}</a>"
		end
		partial_html << "</div>"
		Partial.create(customers: customers, partial_html: partial_html)
	end
end
