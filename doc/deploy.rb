require "bundle/capistrano"
set :application, "yolift"
set :repository, "git://github.com/yeyong14/yolift.git"
set :branch, "master"
set :scm, :git
set :user, "ubuntu"
set :deploy_to, "/home/#{user}/#{application}"
set :runner, "ubuntu"
set :deploy_via, :remote_cache
set :git_shallow_clone, 1

role :web, "www.yolift.com"
role :app, "www.yolift.com"
role :db,  "www.yolift.com", primary => true

set :unicorn_path, "#{deploy_to}/current/config/unicorn.rb"

namespace :deploy do
	task :start, :roles => :app do
		run "cd #{deploy_to}/current/; RAILS_ENV=production unicorn_rails -c #{unicorn_path} -D"
	end
	task :stop, :roles => :app do
		run "kill -QUIT `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
	end
	desc "Restart Application"
	task :restart, :roles => :app do
		run "kill -USR2 `cat #{deploy_to}/current/tmp/pids/unicorn.pid`"
	end
end

task :init_shared_path, :role => :web do
	run "mkdir -p #{deploy_to}/shared/log"
	run "mkdir -p #{deploy_to}/shared/pids"
	run "mkdir -p #{deploy_to}/shared/assets"
end
task :link_shared_files, :roles => :web do
	run "ln -sf #{deploy_to}/shared/config/*.yml #{deploy_to}/current/config/"
	run "ln -sf #{deploy_to}/shared/config/unicorn.rb #{deploy_to}/current/config/"
	run "ln -s #{deploy_to}/shared/assets #{deploy_to}/current/public/assets"
end
task :restart_resque, :roles => :web do
	  run "cd #{deploy_to}/current/; RAILS_ENV=production ./script/resque stop; RAILS_ENV=production ./script/resque start"
end
task :create_database, :roles => :web do
	  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:create"
end
task :compile_assets, :roles => :web do     
	run "cd #{deploy_to}/current/; bundle exec rake assets:precompile"    
end
task :migrate_database, :roles => :web do
	  run "cd #{deploy_to}/current/; RAILS_ENV=production bundle exec rake db:migrate"
end
after "deploy:finalize_update","deploy:symlink", :init_shared_path, :link_shared_files, :compile_assets, :create_database, :migrate_database
set :default_environment, {
	'PATH' => "/home/ubuntu/.rvm/gems/ruby-2.0.0-p247/bin:/home/ubuntu/.rvm/gems/ruby-2.0.0-p247@global/bin:/home/ubuntu/.rvm/rubies/ruby-2.0.0-p247/bin:/home/ubuntu/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games",
	'RUBY_VERSION' => 'ruby-2.0.0-p247',
	'GEM_HOME' => '/home/ubuntu/.rvm/gems/ruby-2.0.0-p247',
	'GEM_PATH' => '/home/ubuntu/.rvm/gems/ruby-2.0.0-p247:/home/ubuntu/.rvm/gems/ruby-2.0.0-p247@global'
}
