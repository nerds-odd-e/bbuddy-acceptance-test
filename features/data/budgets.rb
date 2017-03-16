Transform /^table:month,amount$/ do |table|
  table.hashes.map {|row| Budget.new(row) }
end

Transform /^month (\d+-\d+) and amount (\d+)$/ do |month, amount|
  Budget.new(month: month, amount: amount)
end
