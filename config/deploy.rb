# Configuración de deploy.
lock '~> 3.11.1'

set :application, 'sigi'
set :repo_url, 'git@gitlab.com:syntax-wara/sigi.git'

# Valores default de capistrano.
set :format, :pretty
set :log_level, :debug
set :pty, false
set :keep_releases, 5
set :format_options, command_output: true, log_file: 'log/capistrano.log',
  color: :auto, truncate: :auto

set :branch, ENV['DEPLOY_BRANCH'] || :master

# rbenv.
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

# Rails.
# Usamos diferentes llaves por entorno.
set :key_path, "config/credentials/#{fetch(:stage)}.key"

# Agregar binarios a correr con rbenv (hay varios default).
append :rbenv_map_bins, 'yarn'

append :linked_dirs,
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'storage',
  'public/packs'

append :linked_files,
  fetch(:key_path)

set :migration_role, :app

# Bundler.
append :linked_dirs, '.bundle'

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Puma.
set :puma_preload_app, true
set :puma_init_active_record, true

# Tareas extras.
after 'deploy:updated', 'webpacker:precompile'
