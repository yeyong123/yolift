set :application, "yolift"
set :repository,  "https://github.com/yeyong14/yolift.git"

# You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "ubuntu"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :scm, :git 
set :branch, 'master'
set :runner, "ubuntu"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1
role :web, "122.226.100.35"                          # Your HTTP server, Apache/etc
role :app, "122.226.100.35"                          # This may be the same as your `Web` server
role :db,  "122.226.100.35", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"
set :unicorn_path, "#{deploy_to}/current/config/unicorn.rb"
namespace :deploy do
	%w[start stop restart].each do |command|
		desc "#{command} unicorn server"
		task command, roles: :app, except: {no_release: true} do
			run "/etc/init.d/unicorn_#{application} #{command}" # Using unicorn as the app server
		end
	end
end

	#task :start, :roles => :app do
	#	run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec unicorn_rails -c #{unicorn_path} -D"
	#end

	#task :stop, :roles => :app do
	#	run "kill -QUIT `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
	#end

	#desc "Restart Application"
	#task :restart, :roles => :app do
	#	run "kill -USR2 `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
	#end
#end
task :init_shared_path, :roles => :web do
	run "mkdir -p #{deploy_to}/shared/log"
	run "mkdir -p #{deploy_to}/shared/pids"
	run "mkdir -p #{deploy_to}/shared/assets"
end

task :link_shared_files, :roles => :web do
	run "ln -sf #{deploy_to}/shared/config/*.yml #{deploy_to}/current/config/"
	run "ln -sf #{deploy_to}/shared/config/unicorn.rb #{deploy_to}/current/config/"
	run "ln -sf #{deploy_to}/shared/config/initializers/secret_token.rb #{deploy_to}/current/config/initializers"
	run "ln -sf #{deploy_to}/shared/config/faye_thin.yml #{deploy_to}/current/faye_server/thin.yml"
end

task :create_database, :roles => :web do
	run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:create_database"
end

task :compile_assets, :roles => :web do
	run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake assets:precompile"
end

#task :sync_assets_to_cdn, :roles => :web do
#	run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake assets:cdn"
#Aend

task :migrate_database, :roles => :web do
	run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:migrate"
end

after "deploy:finalize_update","deploy:symlink", :init_shared_path, :link_shared_files, :compile_assets, :migrate_database

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
