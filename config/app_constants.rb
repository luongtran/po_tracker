ENV['MATERIAL_TRACKER_VERSION'] = '<%= app_version %>'

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
#ENV['RAILS_ENV'] ||= 'production'
#ENV['MAIL_DOMAIN'] ||= '<%= app_name %>'

DOMAIN = '<%= app_name %>'

# Sitename displayed in main layout under "MATERIAL TRACKER" title.
# Helps to distinguish 'BP Carson' from 'BP Cherrypoint' from 'localhost' (for dev!)
DEPLOY_SITE_NAME = '<%= deploy_site_name %>'
ENV['DEPLOY_SITE_NAME'] = DEPLOY_SITE_NAME

ENV['WAREHOUSE_NAME'] = '<%= warehouse_name %>'

ENV['WAREHOUSE_EMAIL'] = '<%= warehouse_email %>'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Not needed since we don't need to sudo or anything for BPCherryPoint
# Ex: "sudo -u apache -H"
ENV['REPORT_USER_COMMAND'] = ''

# Pick whatever you want for this. This is only used for crontab calls to
# start delta indexing using the running Rails instance. Not a great idea for performance
# (as it eats up a Rails app instance, blocking incoming requests) but this bypasses
# the need to run "rake ts:in:delta", which would boot up another rails instance anyway.
SPHINX_INDEXING_PASSWORD = '<%= sphinx_indexing_password %>'

