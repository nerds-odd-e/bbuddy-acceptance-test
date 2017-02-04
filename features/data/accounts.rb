def create_account(account)
  Account.create(name: account['name'], balance: account['balance brought forward'])
end