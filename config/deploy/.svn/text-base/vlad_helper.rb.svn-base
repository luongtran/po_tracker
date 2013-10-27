require 'tempfile'
namespace :vlad do
  namespace :svn do
    remote_task :switch, :roles => [:app] do
      run "if [[ -d #{scm_path}/.svn ]]; then cd #{scm_path} && svn switch #{repository}; fi"
    end
  end

  #remote_task :update => %w[svn:switch]
end

def scp(source_file_path, destination_file_path)
	sh "scp #{source_file_path} #{domain}:#{destination_file_path}"
end

# Input an integer start time in minutes, and it will output a string of 5 minute increments
# up to 60. Used in the "crontab.erb" template.
#
# Ex:
# 	cron_iterator(0) #=> 0,5,10,15,20,25,30,35,40,45,50,55
# 	cron_iterator(4) #=> 4,9,14,19,24,29,34,39,44,49,54,59
def cron_iterator(start = 0)
	end_number = 60	# mins
	period = 5 		# mins
	i = start
	times = []
	while i < 60
		times << i
		i += period
	end
	times.join(',')
end


# Returns the temp file of the new erb-filled string
def process_erb_template(template_file_name, location = false)

	# Sets default folder for templates
	if location == false
		location = File.join(RAILS_ROOT, '..', 'config', 'deploy', 'templates')
	end

	# Grabs the template into a string
	file_string = ''
	File.open(File.join(location, template_file_name)) do |f|
		file_string = f.read
	end

	# Processes the file with ERB
	erb = ERB.new(file_string)
	new_file_string = erb.result

	# Creates a new tempfile from the ERB result
	temp_file = Tempfile.new('vlad_erb_template')
	temp_file.puts new_file_string
	temp_file.close

	return temp_file
end

# Fix cuz RyanB from ZenSpider won't respond to my Vlad ticket...
class Vlad::Subversion
  	##
  	# Returns the command that will export +revision+ from the repository into
  	# the directory +destination+.
	def export(source, destination)
    	"#{svn_cmd} #{deploy_via} \".\" #{destination}"
   end
end

module VladHelper
include Rake::DSL
  def load_vlad_tasks
    namespace :vlad do
      extend Rake::DSL if defined? Rake::DSL
      def current_namespace
        "production"
      end

      remote_task :setup_all do
        Rake::Task['vlad:setup_dirs'].invoke
        #Rake::Task['vlad:database_yml'].invoke
        Rake::Task['vlad:sphinx_yml'].invoke

        Rake::Task['vlad:update_scm'].invoke
        Rake::Task['vlad:update_links'].invoke

        Rake::Task['vlad:app_constants'].invoke


        
        run "echo ::: Loading DB Schema :::"
        #run "cd #{release_path};rake RAILS_ENV=production db:create;"
        run "cd #{release_path};bundle exec rake RAILS_ENV=production db:schema:load;"
      end


      desc "Setup the application directories on #{current_namespace} server"
      remote_task :setup_dirs do
        dirs = [deploy_to, releases_path, scm_path, shared_path]
        dirs += %w(attachments crontabs log pids sphinx_config sphinx_index).map { |d| File.join(shared_path, d) }
        run "umask 02 && mkdir -p #{dirs.join(' ')}"
      end

      remote_task :app_constants do
        temp_file = process_erb_template('app_constants.rb.erb')
        scp(temp_file.path, "#{release_path}/config/app_constants.rb")
      end


      remote_task :logo_file do
        #debugger
        run "echo 'Copying Logo to Reports Directory'"
        run "cp #{scm_path}/reports/graphics/#{reports_logo_file} #{release_path}/reports/logo.bmp"
        run "echo 'Copying Logo to Graphics Directory'"
        run "cp #{scm_path}/reports/graphics/#{logo_file} #{release_path}/app/assets/images/graphics/logo.gif"

      end

      remote_task :database_yml do
        temp_file = process_erb_template('database.yml.erb')
		    scp(temp_file.path, "#{shared_path}/database.yml")

        run "mkdir -p ~/.borland/"
        temp_file = process_erb_template('dbxconnections.erb')
        scp(temp_file.path, "~/.borland/dbxconnections")

        temp_file = process_erb_template('dbxdrivers.erb')
        scp(temp_file.path, "~/.borland/dbxdrivers")

        temp_file = process_erb_template('.odbc.ini.erb')
        scp(temp_file.path, "~/.odbc.ini")
   	  end

   	  remote_task :sphinx_yml do
    	  temp_file = process_erb_template('sphinx.yml.erb')
		    scp(temp_file.path, File.join(shared_path, "sphinx_config", "sphinx.yml"))
   	  end

      remote_task :crontab do
        temp_file = process_erb_template('crontab.erb')
        file_name = "crontab.txt"
        scp(temp_file.path, File.join(shared_path, 'crontabs', file_name))
        run "cd #{File.join(shared_path, 'crontabs')} && crontab #{file_name}"
     	end

    desc "Update The asset pipeline(js/css)"
    remote_task :assets_precompile do

      run "echo 'Packaging Assets'"
      run "cd #{release_path} && bundle exec rake RAILS_ENV=production assets:precompile"
    end


    desc "Update to the latest revision on #{current_namespace} server"
    remote_task :update_links do
      #This will be done by default in newer versions of Rake.
      #Rake::Task['vlad:update'].invoke

      # asset packager stuff
      #scm_path = '/home/applications/popv_branch/scm'
#      copy_js = "cp #{scm_path}/public/javascripts/base_*.js #{current_path}/public/javascripts/."
#      copy_css = "cp #{scm_path}/public/stylesheets/base_*.css #{current_path}/public/stylesheets/."
#      copy_popv_js = "cp #{scm_path}/public/javascripts/popv_production_*.js #{current_path}/public/javascripts/."
#      copy_popv_css = "cp #{scm_path}/public/stylesheets/popv_*.css #{current_path}/public/stylesheets/."

      


      run "echo 'Setting Permissions on /public'"
      run "chmod -R 755 #{release_path}/public/"
      run "echo Linking #{release_path}/config/database.yml to #{shared_path}/database.yml"

      run "echo 'Creating symlinks...'"
      run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
      #run "ln -s #{shared_path}/index #{release_path}/index"
      run "ln -s #{shared_path}/sandbox.txt #{release_path}/sandbox.txt"
      run "ln -s #{shared_path}/sphinx_config/sphinx.yml #{release_path}/config/sphinx.yml"
      run "ln -s #{shared_path}/sphinx_config/production.sphinx.conf #{release_path}/config/production.sphinx.conf"
      run "ln -s #{shared_path}/sphinx_index #{release_path}/db/sphinx"
      run "ln -s #{shared_path}/docs/All_Piping_Classes.pdf #{release_path}/public/docs/All_Piping_Classes.pdf"

      run "mkdir -p #{shared_path}/attachments/piping_references"
      run "ln -s #{shared_path}/attachments/piping_references #{release_path}/data/piping_references"

      run "mkdir -p #{shared_path}/attachments/general_references"
      run "ln -s #{shared_path}/attachments/general_references #{release_path}/data/general_references"

      run "mkdir -p #{shared_path}/attachments/quote_attachments"
      run "ln -s #{shared_path}/attachments/quote_attachments #{release_path}/data/quote_attachments"

      run "mkdir -p #{shared_path}/attachments/material_request_attachments"
      run "ln -s #{shared_path}/attachments/material_request_attachments #{release_path}/data/material_request_attachments"

      run "mkdir -p #{shared_path}/attachments/material_request"
      run "ln -s #{shared_path}/attachments/material_request #{release_path}/data/material_request"

      run "mkdir -p #{shared_path}/attachments/tickets"
      run "ln -s #{shared_path}/attachments/tickets #{release_path}/data/tickets"

      run "mkdir -p #{shared_path}/assets"
      run "ln -s #{shared_path}/assets #{release_path}/public/assets"

      run "echo Done creating symlinks."


      htaccess_command = "echo '#{htaccess}' > #{release_path}/public/.htaccess"
      run "echo Creating .htaccess file: #{htaccess_command}"
      run htaccess_command
    end


    desc "Add a new releases directory and set its permissions"
    remote_task :update_scm, :roles => :app do
      perm_owner = "#{user}"
      perm_group = "#{user}"
      
      begin
        commands = [
          "umask #{umask}",
          "cd #{scm_path}",
          "#{source.checkout revision, scm_path}",
          "#{source.export revision, release_path}",
          "chmod -R g+w #{latest_release}",
        ]
        unless shared_paths.empty?
          commands << "rm -rf #{shared_paths.values.map { |p| File.join(latest_release, p) }.join(' ')}"
        end
        unless mkdirs.empty?
          dirs = mkdirs.map { |d| File.join(latest_release, d) }.join(' ')
          commands << "mkdir -p #{dirs}"
          commands << "chown -R #{perm_owner} #{dirs}" 
          commands << "chgrp -R #{perm_group} #{dirs}" 
        end

        commands << "chown -R #{perm_owner} #{latest_release}"
        commands << "chgrp -R #{perm_group} #{latest_release}"

        run commands.join(" && ")        
      rescue => e
        
        run "rm -rf #{release_path}"
        raise e
      end
    end
    #update_scm and update_final were borrowed directly from the vlad core.rb file.
    desc "Finalize the symlinks/permissions.  MUST HAVE update_scm run first"
    remote_task :update_final, :roles => :app do
      perm_owner = "#{user}"
      perm_group = "#{user}"
      symlink = false
      begin
        Rake::Task['vlad:update_symlinks'].invoke

        symlink = true
        commands = [
          "umask #{umask}",
          "rm -f #{current_path}",
          "ln -s #{latest_release} #{current_path}",
          "echo #{now} $USER #{revision} #{File.basename(release_path)} >> #{deploy_to}/revisions.log"
        ]
        commands << "chown #{perm_owner} #{deploy_to}/revisions.log" 
        commands << "chgrp #{perm_group} #{deploy_to}/revisions.log"

        run commands.join(' && ')
      rescue => e
        run "rm -f #{current_path} && ln -s #{previous_release} #{current_path}" if
          symlink
        run "rm -rf #{release_path}"
        raise e
      end
    end

	# Restarts the sphinx server
    remote_task :sphinx_restart do
      run "cd #{release_path} && bundle exec rake RAILS_ENV=production thinking_sphinx:custom:rebuild"
    end

    desc "Restart lighttpd on #{current_namespace} server"
    remote_task :restart do
      run "touch #{current_path}/tmp/restart.txt"
    end

    desc "Rollsback to last deployed revision on #{current_namespace} server"
    remote_task :rollback do
      run "rm #{current_path}; ln -s #{previous_release} #{current_path} && rm -rf #{current_release}"

      Rake::Task["#{current_namespace}:restart"].invoke
    end

    remote_task :version_dump do
      run "svn info #{scm_path} | grep ^Revision > #{release_path}/app/views/shared/_version.html.erb"
   	end

    desc "Update to latest revision and restart the server on #{current_namespace} server"
    remote_task :deploy => %w[update_scm update_links app_constants vlad:bundle:install logo_file assets_precompile version_dump sphinx_yml sphinx_restart crontab update_final restart cleanup]

    desc "Deploy the latest revision and run the migrations on #{current_namespace} server"
    #remote_task :deploy_and_migrate => [:ferret_stop, :update, :migrate, :ferret_start, :restart]
    remote_task :deploy_and_migrate => [:deploy, :migrate]
  end
  end
end
