require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')
require('pry')



  get('/') do
    erb(:input)
  end

  get('/interact') do
    erb(:interact)
  end

  post ('/output') do

    @pet_name = params.fetch('pet_name')
    new_pet = Tamagotchi.new(@pet_name)
    new_pet.save()
    @display_name = new_pet.name
    @display_food_level = new_pet.food_level
    @display_sleep_level = new_pet.sleep_level
    @display_activity_level = new_pet.activity_level
    @display_birth_time = new_pet.birth_time
    @display_age = new_pet.age
    erb(:output)
  end

post ('/interact') do
   button_select = params.fetch('select')
   if button_select == "feed"
     Tamagotchi.all[0].feed_pet
     Tamagotchi.all[0].real_age
     time_since_last_check = Time.new - Tamagotchi.all[0].last_check
     Tamagotchi.all[0].update_last_check
   elsif button_select == "sleep"
     Tamagotchi.all[0].sleep_pet
     Tamagotchi.all[0].real_age
     time_since_last_check = Time.new - Tamagotchi.all[0].last_check
     Tamagotchi.all[0].update_last_check
   else button_select == "play"
     Tamagotchi.all[0].play_pet
     Tamagotchi.all[0].real_age
     time_since_last_check = Time.new - Tamagotchi.all[0].last_check
     Tamagotchi.all[0].update_last_check
   end
     Tamagotchi.all[0].life_passes(time_since_last_check)

  @display_name = Tamagotchi.all[0].name
  @display_food_level = Tamagotchi.all[0].food_level
  @display_sleep_level = Tamagotchi.all[0].sleep_level
  @display_activity_level = Tamagotchi.all[0].activity_level
  @display_birth_time = Tamagotchi.all[0].birth_time
  @display_age = Tamagotchi.all[0].age.floor
  @display_last_check = time_since_last_check

 erb(:output)
end
