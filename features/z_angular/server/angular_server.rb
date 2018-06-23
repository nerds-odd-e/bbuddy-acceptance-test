require 'optparse'

def start_server
  @rails_pid = spawn({'RAILS_ENV' => 'test'}, 'bundle exec rails s -p 4000', chdir: '../bbuddy-api')
  angular_folder = ENV['ANGULAR'] ? ENV['ANGULAR'] : '../bbuddy-angular'
  @gulp_pid = spawn("gulp server --cwd #{angular_folder} --production")
  sleep 2
end

def stop_server
  Process.kill('KILL', @rails_pid)
  Process.kill('KILL', @gulp_pid)
end
