def start_server
  `RAILS_ENV=test rails s -d -p 4000`
  @gulp_pid = IO.popen("gulp --cwd ../bbuddy-angular &").pid
end

def stop_server
  `kill -9 $(cat tmp/pids/server.pid)`
  `kill -9 #{@gulp_pid}`
end