module CustomersHelper

	LE_SCRIPT = "<?php
	define('ACCESS_KEY', '[ACCESS_KEY]');
	define('ID', [ID]);
	define('SERVER', '[SERVER]');
	$partial = file_get_contents('http://' . SERVER . '/api/v1/outputs/get_partial');
?>"

	def self.customer_le_script(customer, host_with_port)
		LE_SCRIPT.gsub('[ACCESS_KEY]', customer.access_key).gsub('[ID]',customer.id.to_s).gsub('[SERVER]', host_with_port)
	end

end