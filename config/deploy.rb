set :application, 'allenlsy.github.com'
set :repo_url, 'git@github.com:allenlsy/allenlsy.github.com.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, "/home/allenlsy/allenlsy.github.com"
set :scm, :git

# server '162.217.248.104'
set :user, 'allenlsy'

set :default_run_options, {
  pty: true
}

# set :ssh_options, {
#   forward_agent: true
# } 

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

after "deploy:finished", "deploy:jekyll_build"

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'build jekyll '
  task :jekyll_build do
    on roles(:blog) do |host|
      within "#{ferch(:deploy_to)/current}" do
        execute 'bundle'
        execute 'jekyll build'
      end
    end
  end

end
