require ('rspec')
require('tamagotchi')
require ('pry')


describe(Tamagotchi) do
  describe("#initialize") do
    it("sets the name and life levels of a new Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.name()).to(eq("lil dragon"))
      expect(my_pet.food_level()).to(eq(10))
      expect(my_pet.sleep_level()).to(eq(10))
      expect(my_pet.activity_level()).to(eq(10))
    end
  end

  describe("#is_alive") do
    it("is alive if the food level is above 0") do
      my_pet = Tamagotchi.new("lil dragon")
      expect(my_pet.is_alive()).to(eq(true))
    end
  end

    it("is dead if the food level is 0") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_food_level(0) #make a method that will change the food level of your tamagotchi.
      expect(my_pet.is_alive()).to(eq(false))
    end

  describe("#time_passes") do
    it("decreases the amount of food the Tamagotchi has left by 1") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.time_passes()  #decide what trigger you will use to make time pass
      expect(my_pet.food_level()).to(eq(9))
    end
  end

  describe("#age of Tamagotchi") do
    it("determine the age of Tamagotchi") do
      my_pet = Tamagotchi.new("lil dragon")
      my_pet.set_birthday(0)
      my_pet.test_age(10)
      expect(my_pet.age()).to(eq(10))
    end
  end

end
