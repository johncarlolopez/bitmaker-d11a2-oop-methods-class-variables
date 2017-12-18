# 02 - Object Oriented Programming: Class Methods and Class Variables
### Monday, Dec 18th

## Part 1: Bank Account
___
1. Create a class called BankAccount.
2. Add a class variable called @@interest_rate that is a float representing the interest rate for all the accounts in the bank. This is a class variable because it is the same value for all accounts.
3. Add another class variable called @@accounts that starts as an empty array. This will eventually store the list of all bank accounts in the bank.
4. Add an initialize instance method that sets @balance to zero. You should also add reader and writer methods for balance to your class. Balance is stored in an instance variable because the value needs to be different from account to account.
5. Add an instance method called deposit that accepts a number as an argument and adds that amount to the account's balance.
This needs to be an instance method because it pertains to a single, specific account.
6. Add an instance method called withdraw that accepts a number as an argument and subtracts that amount from the account's balance.
7. Add a class method called create that calls BankAccount.new and adds the new object to @@accounts so that we can find it again in the future. This method should return the new account object. This needs to be a class method because at the time we run it there is no single, specific account object that we are working on.
8. Add a class method called total_funds that returns the sum of all balances across all accounts in @@accounts.
This needs to be a class method because it does not pertain to any single, specific account.
9. Add a class method called interest_time that iterates through all accounts and increases their balances according to @@interest_rate.

### Example output
___
```
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
```

## Part 2: Book Lending
___
In this assignment you're going to build a simple book lending program in order to practice using class variables and class methods.

#### A side note on Time
___
In this assignment you'll be making use of Ruby's Time object in order to manage the due dates of the books. Before getting started on the book program, open an irb session and the Time docs and spend a few minutes familiarizing yourself with this part of Ruby. Try calling Time.now to see what it returns. What happens if you run Time.now + 60 or Time.now - 360?

### Your task
___
1. Create a class called Book.
2. Your class should have two class variables: @@on_shelf and @@on_loan. Both should start as empty arrays. @@on_shelf will contain the collection of book objects that are available to be lent out and @@on_loan will contain the collection of books that are currently being borrowed.
3. Your class will also need reader and writer methods for due_date.
4. Your class should have the following methods:
  * an instance method initialize
  * an instance method borrow
  * an instance method return_to_library
  * an instance method lent_out?
  * a class method create
  * a class method current_due_date
  * a class method overdue_books
  * a class method browse
  * a class method available
  * a class method borrowed

initialize

This instance method makes a new book object. It should initialize a book's title, author, and isbn.

create

This class method is how new books are added to the library. This method should call Book.new(...),add the new book object to @@on_shelf, and then return the new book.

available

This class method should return the value of @@on_shelf.

borrowed

This class method should return the value of @@on_loan.

browse

This class method should return a random book from @@on_shelf (you may need to consult the Array docs to figure out how to do this).

lent_out?

This instance method return true if a book has already been borrowed and false otherwise.

current_due_date

This class method should return the due date for books taken out today. It's up to you to decide how far in the future the due date should be. You can refer to the section about Time above for help getting started, and don't hesitate to ask for help if you're stuck!

borrow

This instance method is how a book is taken out of the library. This method should use lent_out? to check if the book is already on loan, and if it is this method should return false to indicate that the attempt to borrow the book failed. Otherwise, use current_due_date to set the due_date of the book and move it from the collection of available books to the collection of books on loan, then return true.

return_to_library

This instance method is how a book gets returned to the library. It should call lent_out? to verify that the book was actually on loan. If it wasn't on loan in the first place, return false. Otherwise, move the book from the collection of books on loan to the collection of books on the library shelves, and set the book's due date to nil before returning true.

overdue

This class method should return a list of books whose due dates are in the past (ie. less than Time.now).

As you write your program you should be thinking about the reasoning behind making each method either an instance method or a class method.

#### Example output
___
```
sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # []
puts sister_outsider.lent_out? # false
puts sister_outsider.borrow # true
puts sister_outsider.lent_out? # true
puts sister_outsider.borrow # false
puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
puts Book.overdue.inspect # []
puts sister_outsider.return_to_library # true
puts sister_outsider.lent_out? # false
puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
puts Book.borrowed.inspect # []
```

#### Stretch goals
___
Add a renew method to push the due date back.
If someone tries to borrow a book and it's already on loan, find a way to indicate that the book has been put on hold. If a book is on hold you shouldn't be able to renew it.
Add a genre to each book and allow users to browse by genre.
Add a class method that accepts a title, author, or isbn as an argument and returns all books that match.

## Part 3: Zombie Apocalypse
___
It's the zombie apocalypse! But that doesn't mean we don't have time to practice using class variables and methods.

#### A side note on random numbers
___
We're going to be using Ruby's rand method to generate randomness in our game. rand accepts one number as an argument and returns a random number that is less than that argument and greater than -1. So rand(5) would return a random number between 0 and 4, and rand(10) would return a number between 0 and 9.

Before you start writing your zombie program you should go into irb and try calling rand a handful of times in order to get comfortable with how it works.

### It's the zombie apocalypse
___
1. Create a class called Zombie.
2. Your class should have the following class variables:
  * @@horde should start as an empty array and will eventually contain the collection of all zombies.
  * @@plague_level should start at 10 and will be used to determine the rate at which new zombies are spawned. This value will increase over time.
  * @@max_speed should be set to 5 and indicates the maximum value for the speed attribute of any zombie. This value won't change.
  * @@max_strength should be set to 8 and indicates the maximum value for the strength attribute of any zombie. This value won't change.
  * @@default_speed should be set to 1. This value won't change.
  * @@default_strength should be set to 3. This value won't change.

3. Your class should have the following methods:
  * an instance method initialize
  * an instance method encounter
  * an instance method outrun_zombie?
  * an instance method survive_attack?
  * a class method all
  * a class method new_day
  * a class method some_die_off
  * a class method spawn
  * a class method increase_plague_level  

initialize

This instance method should take two integer arguments: one for the zombie's speed attribute and one for its strength. If the speed argument is greater than @@max_speed then @@default_speed should be used as the new zombie's speed instead. Similarly, you should check to make sure the strength argument is less than or equal to @@max_strength, otherwise @@default_strength should be used as the new zombie's strength attribute.

all

This class method should return the value of @@horde.

spawn

This class method should use @@plague_level to generate a random number and then create that number of new zombies, adding each one to @@horde. Use @@max_speed and @@max_strength to generate random values for each new zombie's speed and strength.

new_day

This class method represents the events of yet another day of the zombie apocalypse. Every day some zombies die off (phew!), some new ones show up, and sometimes the zombie plague level increases. In order to accomplish this, new_day should call some_die_off, spawn, and increase_plague_level.

increase_plague_level

This class method should generate a random number between 0 and 2 and increase @@plague_level by that amount.

some_die_off

This class method should generate a random number between 0 and 10 and remove that number of zombies from @@horde (hint: you may want to check the Array docs for methods that could help you accomplish this).

encounter

This instance method represents you coming across a zombie! This can end in three possible outcomes: 1. escaping unscathed 2. being killed by the zombie 3. catching the plague and becoming a zombie yourself.

This method should call outrun_zombie? (see below) and survive_attack? (see also below) to determine which scenario applies. In the case that you are turned into a zombie (ie. you don't outrun the zombie but you aren't killed by it), create a new zombie object (that's you!) and add it to the @@horde.

In all three cases you should return a string that describes what happened to you in the encounter (eg. "You escaped!").

outrun_zombie?

This instance method should use @@max_speed to generate a random number that represents how fast you manage to run from this particular zombie. This method should return true if your speed is greater than the zombie's and false otherwise.

survive_attack?

This instance method should use @@max_strength to generate a random number that represents how well you are able to fight off this zombie. This method should return true if your strength is greater than the zombie's and false otherwise.

### Example output
___
Note: due to the random number generation in this program, keep in mind that your output will be different.
```
puts Zombie.all.inspect # []
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died
```
#### Stretch goals:
___
Change the increase_plague_level method so that the amount the plague level increases is somehow based on the number of zombies in the horde, instead of being completely random.
Add a method called deadliest_zombie that returns the zombie that has the highest combination of speed and strength. Should this be a class method or an instance method?

## Part 4: Vampires!
___
### Vampires!
___
Your task is to create a Vampire class that stores a list of vampires (a coven, if you will). Every vampire has a name, age, an in_coffin boolean, and a drank_blood_today boolean.

Every day at sunset the vampires leave their coffins in search of blood. If they don't drink blood and get back to their coffins before sunrise, they die.

Your class should have the following methods:

  * initialize, which creates a new vampire and assigns values for each of its attributes
  * create, which creates a new vampire and adds it to the coven
  * drink_blood, which sets a vampire's drank_blood_today boolean to true
  * sunrise, which removes from the coven any vampires who are out of their coffins or who haven't drank any blood in the last day
  * sunset, which sets drank_blood_today and in_coffin to false for the entire coven as they go out in search of blood
  * go_home, which sets a vampire's in_coffin boolean to true  

It's up to you to determine whether each method should be a class method or an instance method, as well as deciding what class and instance variables you need.

If you're not sure which kind of method to define, starting to write the body of the method may help you figure it out. If you're still uncertain, don't be afraid to ask an instructor to help you work through the problem.

Good luck!
