require 'vlad'
require "bundler/vlad"
require 'erb'
require_relative "vlad_helper.rb"
include VladHelper

# Used for jammit asset referencing
RAILS_ROOT = File.join(File.dirname(__FILE__), "..") unless defined? RAILS_ROOT

APP_VERSION = '3.4.2'

set :keep_releases, 5											# Save this many past releases
set :revision, "HEAD"

# BP Cherrypoint Staging and Production Deployments:
task :rtc_tesoro do
  set :deploy_site_name,  "Tesoro Carson"
  set :user,        "tesoro-carson"
  set :logo_file,  "tesoro_logo.gif"
  set :reports_logo_file,  "tesoro_logo.bmp"
  set :deploy_to,       "/home/tesoro-carson/rails_app"
  set :app_name,      "tesoro-carson.telaeris.net"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,      "tesoro-carson@rails.telaeris.com"
  set :htaccess,      "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,   3314
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'Euok3gCjJ6C7ffjL2oJgBS555'
  # Used to set the time the delta indexing for the crontab will start.
  set :sphinx_index_start_minute, 2
  set :app_version,   APP_VERSION
  set :warehouse_name, 'Carson Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end

# BP Cherrypoint Staging and Production Deployments:
task :rtc_potracker do
  set :deploy_site_name,  "RTC Material Tracker"
  set :user,        "potracker"
  set :logo_file,  "default_logo.gif"
  set :reports_logo_file,  "default_reports_logo.bmp"
  set :deploy_to,       "/home/potracker/rails_app"
  set :app_name,      "rails.telaeris.com"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,      "potracker@rails.telaeris.com"
  set :htaccess,      "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,   3312
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'Euok3gCjJ6C7ffjL2oJgBS555'
  # Used to set the time the delta indexing for the crontab will start.
  set :sphinx_index_start_minute, 2
  set :app_version,   APP_VERSION
  set :warehouse_name, 'Sample Warehouse'
  set :warehouse_email, 'chris.stotts@telaeris.com'
end


# BP Cherrypoint Staging and Production Deployments:
task :rtc_bpcp do
  set :deploy_site_name,  "BP Cherrypoint"
  set :user,        "bpcp"
  set :app_name,      "bpcp.telaeris.net"
  set :logo_file,  "bp_logo.gif"
  set :reports_logo_file,  "bp_reports_logo.bmp"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,      "#{user}@bpcp.telaeris.net"
  set :htaccess,      "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,   3313
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'NGUHU7Dzyp6hRf4ZJyrpAgyZ2'
  set :sphinx_index_start_minute, 3
  set :app_version,   APP_VERSION
  set :warehouse_name, '5th Warehouse'
  set :warehouse_email, 'bp.carson.fifth@gmail.com'
end

# BP Cherrypoint Staging and Production Deployments:
task :bpcp_staging do
  set :deploy_site_name, 	"BP Cherrypoint Staging"
  set :user,				"bpcp-staging"
  set :logo_file,  "bp_logo.gif"
  set :reports_logo_file,  "bp_reports_logo.bmp"
  set :deploy_to,   		"/home/bpcp-staging/rails_app"
  set :app_name,			"bpcp-staging.telaeris.com"
  set :repository,  		"http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain, 			"bpcp-staging@bpcp-staging.telaeris.com"
  set :htaccess, 			"RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,		3312
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'Euok3gCjJ6C7ffjL2oJgBSl22'
  # Used to set the time the delta indexing for the crontab will start.
  set :sphinx_index_start_minute, 2
  set :app_version,		APP_VERSION
  set :warehouse_name, '5th Warehouse'
  set :warehouse_email, 'bp.carson.fifth@gmail.com'
end
#Technip
task :technip do
  set :deploy_site_name,  "Technip Material Tracker"
  set :user,        "technip"
  set :logo_file,  "technip_logo.gif"
  set :reports_logo_file,  "default_reports_logo.bmp"
  set :deploy_to,       "/home/technip/rails_app"
  set :app_name,      "rails.telaeris.com"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,      "technip@rails.telaeris.com"
  set :htaccess,      "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,   3344
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'Euok3gCjJ6C7ffjL2oZaBS555'
  # Used to set the time the delta indexing for the crontab will start.
  set :sphinx_index_start_minute, 2
  set :app_version,   APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end
task :uptownelectric do
  set :deploy_site_name,   "Uptown Electric"
  set :user,        "uptownelectric"
  set :logo_file,  "uptownelectric.gif"
  set :reports_logo_file,  "uptownelectric_reports_logo.bmp"
  set :app_name,      "uptownelectric.telaeris.net"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@uptownelectric.telaeris.net"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3315
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvcT1Ojz'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end

task :mtdemo do
  set :deploy_site_name,   "Material Tracker Demo"
  set :user,        "mtdemo"
  set :logo_file,  "default_logo.gif"
  set :reports_logo_file,  "default_reports_logo.bmp"
  set :app_name,      "mtdemo.telaeris.net"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@mtdemo.telaeris.net"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3316
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvcT1Ojz'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end


task :ohmstede_production do
  set :deploy_site_name,   "Ohmstede"
  set :user,        "ohmstede"
  set :logo_file,  "ohmstede.gif"
  set :reports_logo_file,  "ohmstede_reports_logo.bmp"
  set :app_name,      "ohmstede.telaeris.net"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@75.98.33.62"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3317
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvDD1Omm'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end


task :creative_production do
  set :deploy_site_name,   "Creative Media Test Material Tracker"
  set :user,        "creative"
  set :logo_file,  "default_logo.gif"
  set :reports_logo_file,  "default_reports_logo.bmp"
  set :app_name,      "creative.telaeris.net"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@75.98.33.62"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3318
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvDD1Omq'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end


task :ohmstedeltd_production do
  set :deploy_site_name,   "Ohmstede Ltd."
  set :user,        "ohmstedeltd"
  set :logo_file,  "ohmstede.gif"
  set :reports_logo_file,  "ohmstede_reports_logo.bmp"
  set :app_name,      "ohmstedeltd.telaeris.net"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@75.98.33.62"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3319
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvDD1Odf'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end

task :nycoem do
  set :deploy_site_name,   "NYC Office of Emergency Management"
  set :user,        "nycoem"
  set :logo_file,  "nyc_oem_logo.gif"
  set :reports_logo_file,  "nyc_oem_reports_logo.bmp"
  set :app_name,      "nycoem.telaeris.net"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@75.98.33.62"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3322
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvcT33jaa'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end


task :sample do
  set :deploy_site_name,   "Material Tracker sample"
  set :user,        "sample"
  set :logo_file,  "default_logo.gif"
  set :reports_logo_file,  "default_reports_logo.bmp"
  set :app_name,      "localhost"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@sample.telaeris.net"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3320
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvcT1OjaZ'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end


task :localhost do
  set :deploy_site_name,   "Material Tracker Demo"
  set :user,        "telaeris"
  set :logo_file,  "default_logo.gif"
  set :reports_logo_file,  "default_reports_logo.bmp"
  set :app_name,      "localhost"
  set :deploy_to,       "/home/#{user}/rails_app"
  set :repository,      "http://home.telaeris.com/svn/rails_tracker/trunk"
  set :domain,       "#{user}@localhost"
  set :htaccess,       "RailsBaseURI /\nPassengerApproot #{deploy_to}/current"
  set :sphinx_port,    3321
  # Used in app_constants.rb template. Not used currently...
  set :sphinx_indexing_password, 'itoqspMds02F967LJPvcT1Ojaa'
  set :sphinx_index_start_minute, 4
  set :app_version,    APP_VERSION
  set :warehouse_name, 'Warehouse'
  set :warehouse_email, 'support@telaeris.com'
end



VladHelper::load_vlad_tasks
