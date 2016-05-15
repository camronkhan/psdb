MIN_THREADS = 1
RAILS_MAX_THREADS = 1

#workers Integer(ENV['WEB_CONCURRENCY'] || 2)	# omit this line when running Puma on Windows
threads_count = RAILS_MAX_THREADS
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end