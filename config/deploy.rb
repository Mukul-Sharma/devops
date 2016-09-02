role :app, 'localhost'

set :local_user, "webonise"
set :copy_dir, "/home/#{local_user}/tmp"
set :remote_copy_dir, "/tmp"

set :use_sudo, false
set :application, "docker-node-cap"
set :repository,  "git@github.com:mukuls-webonise/devops.git"
set :branch, "develop"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/webonise/Documents/#{fetch(:application)}"
set :deploy_via, :copy

before :deploy, "deploy:make_dirs"

namespace :deploy do
  task :make_dirs do
    run "mkdir -p '/home/#{local_user}/Documents/docker-node-cap/releases'"
  end
end

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
