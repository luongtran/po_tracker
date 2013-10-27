require 'acts_as_taggable'
ActiveRecord::Base.send(:include, ActiveRecord::Acts::Taggable)
require File.dirname(__FILE__) + '/../../lib/acts_as_taggable/tagging'
require File.dirname(__FILE__) + '/../../lib/acts_as_taggable/tag'