Transform /^table:name,balance$/ do |table|
  table.hashes.map {|row| Account.new(row) }
end

Transform /^name (\w+) and balance (\d+)$/ do |name, balance|
  Account.new(name: name, balance: balance)
end
