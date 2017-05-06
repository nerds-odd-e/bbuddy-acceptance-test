require 'optparse'

def start_server
  `RAILS_ENV=test rails s -d -p 4000`
  react_folder = ENV['REACT'] ? ENV['REACT'] : '../bbuddy-react'
  @gulp_pid = IO.popen("gulp --cwd #{react_folder} --production &").pid
  sleep 40
end

def stop_server
  `kill -9 $(cat tmp/pids/server.pid)`
  `kill -9 #{@gulp_pid}`
end