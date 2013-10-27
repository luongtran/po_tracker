class VendorAnswer < ActiveRecord::Base
  attr_accessible :answer, :questionairre_date, :questionairre_item_id, :vendor_id
  
  belongs_to :questionairre_item
  belongs_to :vendor
  
end
