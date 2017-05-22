require 'optparse'

def start_server
  @rails_pid = spawn({'RAILS_ENV' => 'test'}, 'rails s -p 4000')
  react_folder = ENV['REACT'] ? ENV['REACT'] : '../bbuddy-react'
  @gulp_pid = spawn("gulp server --cwd #{react_folder} --production")
  sleep 2
end

def stop_server
  Process.kill('KILL', @rails_pid)
  Process.kill('KILL', @gulp_pid)
end