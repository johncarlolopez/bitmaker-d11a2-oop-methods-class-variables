class Book
  @@on_shelf = []
  @@on_loan = []
  def initialize(title,author,isbn)
    @due_date = nil
    @title = title
    @author = author
    @isbn = isbn
  end
  def isbn
    return @isbn
  end
  def due_date
    return @due_date
  end
  def due_date=(time)
    due_date = time
  end
  def borrow
    if !(lent_out?)
      @due_date = self.class.current_due_date
      @@on_loan << self
      @@on_shelf.each { |book|
        if book == self
          @@on_shelf.delete(book)
        end
      }
      return true
    else
      return false
    end
  end
  def return_to_library
    if lent_out?
      @@on_shelf << self
      @@on_loan.each {|book|
        if book == self
          @@on_loan.delete(book)
        end
      }
      @due_date = nil
      return true
    else
      return false
    end
  end
  def lent_out?
    result = false
    @@on_loan.each { |book|
      if book == self
        result = true
      end
    }
    return result
  end
  def self.create(title,author,isbn)
    temp_book = self.new(title,author,isbn)
    @@on_shelf << temp_book
    return temp_book
  end
  def self.current_due_date
    Time.now + (2*7*24*60*60)
  end
  def self.overdue
    books_overdue = []
    @@on_loan.each {|book|
      if Time.now > book.due_date
        books_overdue << book
      end
    }
    return books_overdue
  end
  def self.browse
    @@on_shelf.sample
  end
  def self.available
    @@on_shelf
  end
  def self.borrowed
    @@on_loan
  end
end
