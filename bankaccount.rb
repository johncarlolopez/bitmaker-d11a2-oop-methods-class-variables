#Part 1: Bank Account
#1
class BankAccount
  #2
 @@interest_rate = 0.01
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
 def balance=(tbalance)
   @balance = tbalance
 end
 #5
 def deposit(amount)
   @balance += amount
 end
 #6
 def withdraw(amount)
   @balance -= amount
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
