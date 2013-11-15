desc 'Push to github -> Deploy on server'
task :jekyll do
  run_locally 'git push -f'
  on roles(:blog) do
    run "cd #{deploy_to}"
    run "git pull origin master"
  end
end

# 
# namespace :jekyll do
#   desc 'Push to github -> Deploy on server'
#   task :deploy do
#     run_locally 'git push -f'
#     on roles(:blog) do
#       run "cd #{deploy_to}"
#       run "git pull origin master"
#     end
#   end
# end
