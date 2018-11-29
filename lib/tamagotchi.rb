class Tamagotchi

  attr_accessor(:name, :food_level, :sleep_level, :activity_level, :birth_time, :age, :last_check)

@@list = []

  def self.all()
    @@list
  end

  def self.add_to_list(obj_name)
    @@list.push(obj_name)
  end

  def save()
    @@list.push(self)
  end

  def initialize(name)
    @name = name
    @food_level = 10
    @sleep_level = 10
    @activity_level = 10
    @birth_time = Time.new
    @age = 0
    @last_check = Time.new
  end

  def is_alive
    if @food_level > 0
      true
    else
      false
    end
  end

  def set_food_level(food)
    @food_level = food

  end

  def feed_pet
    @food_level += 1
  end

  def sleep_pet
    @sleep_level += 1
  end

  def play_pet
    @activity_level += 1
  end

 def time_passes
   @food_level -= 1
 end

 def life_passes(time)
   @food_level -= 1
   @sleep_level -= 1
   @activity_level -=1
 end


 def real_age()
   @age = Time.new - @birth_time
 end

 def test_age(test_time)
   @age = test_time - @birth_time
 end

 def set_birthday(test_birthday)
   @birth_time = test_birthday
 end

 def update_last_check
   @last_check = Time.new
 end


end
