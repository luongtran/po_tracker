#$:.unshift "#{File.dirname(__FILE__)}/lib"
#$:.unshift "#{Rails.root}/lib/acts_as_list"
$:.unshift File.dirname(__FILE__) + '/../../lib/acts_as_list'

require 'active_record/acts/list'
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::List }
