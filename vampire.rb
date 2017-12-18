class Vampire
  @@coven =[]
  def initialize(name, age)
    @name = name
    @age = age
    @in_coffin = true
    @drank_blood_today = false
  end

  def drank_blood_today
    return @drank_blood_today
  end
  def drank_blood_today=(val)
    @drank_blood_today = val
  end

  def in_coffin
    return @in_coffin
  end
  def in_coffin=(val)
    @in_coffin = val
  end

  def drink_blood
    if in_coffin
      @drank_blood_today = false
    else
      @drank_blood_today = true
    end
  end

  def go_home
    @in_coffin = true
  end

  def self.create(name,age)
    temp_vamp = self.new(name,age)
    @@coven << temp_vamp
    return temp_vamp
  end

  def self.sunrise
    @@coven.each {|vampire|
      if !((vampire.drank_blood_today) || (vampire.in_coffin))
        @@coven.delete(vampire)
      end
    }
  end

  def self.sunset
    @@coven.each {|vampire|
      vampire.drank_blood_today = false
      vampire.in_coffin = false
    }
  end

  def self.show
    return @@coven
  end
end
