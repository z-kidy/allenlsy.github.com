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

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'Rsync galleries'
  task :galleries do
    run_locally do
      within './' do
        roles(:blog).each do |host|
          execute "rsync -vr --exclude='.DS_Store' tags.html #{fetch(:user)}@#{host}:#{fetch(:deploy_to)}/current/"
          execute "rsync -vr --exclude='.DS_Store' gallery_thumbnails #{fetch(:user)}@#{host}:#{fetch(:deploy_to)}/current/_site/"
        end
      end
    end
  end

  after :finished, :galleries

  # after :finished do
  #   on roles(:blog) do
  #     within "#{deploy_to}/current" do
  #       execute "jekyll build"
  #     end
  #   end
  # end

end
