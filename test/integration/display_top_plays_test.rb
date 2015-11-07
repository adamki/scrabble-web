require 'test_helper'

class DisplayingPlaysTest < ActionDispatch::IntegrationTest

  def test_it_displays_the_top_scoring_plays
   Play.delete_all
   play_1 = Play.create(word: "bark") #10
   play_2 = Play.create(word: "commuter") #14
   play_3 = Play.create(word: "paper") #9
   play_4 = Play.create(word: "hat") #6
   play_5 = Play.create(word: "swiss") #8
   play_6 = Play.create(word: "stuff") #11

   visit '/plays'
   save_and_open_page
   assert page.has_content?("1. commuter - 14")
   assert page.has_content?("2. stuff - 11")
   assert page.has_content?("3. bark  - 10")
   assert page.has_content?("4. paper  - 9")
   assert page.has_content?("5. swiss - 8")
   refute page.has_content?("hat")



  end
end
