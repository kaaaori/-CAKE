class DeliveryAddress < ApplicationRecord
  
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + address_name
  end
  
end
