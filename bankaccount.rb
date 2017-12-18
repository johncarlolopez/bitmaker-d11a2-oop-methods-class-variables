#Part 1: Bank Account
#1
class BankAccount
  #2
 @@interest_rate = 0.02
 #3
 @@accounts = []
 def self.show_accounts
   return @@accounts
 end
 #4
 def initialize
   @balance = 0
 end
 def balance
   return @balance
 end
 def balance=(balance)
   @balance = balance
 end
 #5
 def deposit(amount)
   puts amount.class
   puts balance.class
   balance += amount
 end
 #6
 def withdraw(amount)
   balance -= amount
 end
 #7
 def self.create
   temp_account = self.new
   @@accounts << temp_account
   return temp_account
 end
 #8
 def self.total_funds
   total_funds = 0
   @@accounts.each{ |account| total_funds += account.balance}
   return total_funds
 end
 #9
 def self.interest_time
  @@accounts.each{ |account|  account.balance *= (1 + @@interest_rate )}

 end
end

# BankAccount.create
# BankAccount.create
# BankAccount.create
#
# p BankAccount.show_accounts
# BankAccount.interest_time
# p BankAccount.show_accounts
# p BankAccount.total_funds
my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
