class Call < ActiveRecord::Base
  acts_as_menu

  menu :opening_menu do
    play "/test-sound.mp3"
    say "This is the first menu", voice: "woman", language: "en-gb"
    sms "Whatever I want to say", to: 3602636483, from: 0000000000
    gather do
      prompt 1, "Press 1 to go to the second menu", menu: :second_menu 
      prompt 2, "Press 2 to go to the third menu", menu: :third_menu
    end
    say self.id
  end

  menu :second_menu do
    say "this is the second menu"
    gather do
      prompt 1, "Press 1 to go to the opening menu", menu: :opening_menu
      prompt 2, "Press 2 to go the third menu", menu: :third_menu
    end
  end

  menu :third_menu do
    say "This is the third menu"
    gather do
      prompt 1, "Press 1 to go to the fourth menu", menu: :fourth_menu
    end
  end

  menu :fourth_menu do
    say "You have arrived at the fourth menu!"
  end

  menu :dial_multiple do
    dial_multiple do
      2.times do
        number "hello"
      end
    end
  end

end
