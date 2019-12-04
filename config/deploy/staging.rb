set :deploy_user, ENV['STAGING_DEPLOY_USER']
set :deploy_to, ENV['STAGING_DEPLOY_PATH']
# La precompilación de assets usa :user.
set :user, fetch(:deploy_user)

server ENV['STAGING_DEPLOY_SERVER'], user: fetch(:deploy_user), roles: %w[app web db]
