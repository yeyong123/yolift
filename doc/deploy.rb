set :application, 'yolift'
set :repo_url, 'git@github.com:yeyong14/yolift.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/ubuntu/yolift"
set :scm, :git
set :scm_username, "yeyong14"
set :scm_password, "yeyong157196212"
set :checkout, 			"export"
set :user, 	"ubuntu"
set :runner, "ubuntu"
set :password, "yeyong157196212"
set :use_sudo, false
# set :format, :pretty
# set :log_level, :debug
# set :pty, true

#set :linked_files, %w{config/database.yml}
#set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
#set :default_env, { path: "/opt/ruby/bin:$PATH" }
#set :keep_releases, 5
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

namespace :deploy do
	task :start do
		run "cd #{current_path} && RAILS_ENV=production bundle exec unicorn_rails -c #{unicorn_config} -D"
	end

	task :stop  do
		run "if [ -f #{unicorn_pid} ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
	end

	task :restart do
		# 用USR2信号来实现无缝部署重启
		run "if [ -f #{unicorn_pid} ]; then kill -s USR2 `cat #{unicorn_pid}`; fi"
	end
end
