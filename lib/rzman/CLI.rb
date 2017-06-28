# CLI Controller
require 'date'
require 'pry'

class Rzman::CLI

  def call
    puts "Welcome to RZman!".colorize(:light_blue)
    menu
  end

  def menu
    puts "Please choose from the following:".colorize(:light_blue)
    puts ""
    @first_choice = nil
    puts "1. Get my zmanim for the day"
    puts "2. Get my candle lighting for this Shabbat"
    puts ""
    puts "Please enter '1' or '2' or 'exit'".colorize(:light_cyan)
    @first_choice = gets.strip
    if @first_choice == "1"
      puts "Please enter a valid U.S. zipcode:".colorize(:light_cyan)
      @@zip_input = gets.strip
      if zip_valid? == nil
        puts "Only valid U.S. zipcodes will work (5 digits long).".colorize(:red)
        puts "Do you want to start again? (y/n)".colorize(:light_cyan)
        do_over_choice = gets.strip
        if do_over_choice == "y"
          menu
        else
          goodbye
        end
      else
        get_zmanim
      end
    elsif @first_choice == "2"
      puts "Please enter a valid U.S zipcode:".colorize(:light_cyan)
      @@zip_input = gets.strip
      if zip_valid? == nil
        puts "Only valid U.S. zipcodes will work (5 digits long).".colorize(:red)
        puts "Do you want to start again? (y/n)".colorize(:light_cyan)
        do_over_choice = gets.strip
        if do_over_choice == "y"
          menu
        else
          goodbye
        end
      else
      get_shabbat_zmanim
    end
    elsif @first_choice == "exit"
      goodbye
    else
      return_to_menu
    end
  end

  def return_to_menu
    @first_choice != "1" || @first_choice != "2" || @first_choice != "exit"
    puts "Please enter a valid option.".colorize(:red)
    menu
  end

  def zip_valid?
    @@zip_input.to_s
    @@zip_input.match(/^\d{5}$/)
  end

  def get_zmanim
    Rzman::Zmanim.zmanim_today
    binding.pry
    current_zmanim = Rzman::Zmanim.all.last
    display_zmanim(current_zmanim)
    puts "Do you want to go back to the main menu? (y/n):".colorize(:light_cyan)
    choice = gets.strip
    if choice == "y"
      menu
    else
      goodbye
    end
  end

  def display_zmanim(zmanim)
    puts " "
    puts "Your Zmanim:".colorize(:light_red)
    puts "Sunrise: #{zmanim.sunrise}".colorize(:cyan)
    puts "Midday: #{zmanim.midday}".colorize(:cyan)
    puts "#{zmanim.minha_gedolah_name}: #{zmanim.minha_gedolah}".colorize(:cyan)
    puts "#{zmanim.plag_haminha_name}: #{zmanim.plag_haminha}".colorize(:cyan)
    puts "#{zmanim.nightfall_name}: #{zmanim.nightfall}".colorize(:cyan)
  end

  def get_shabbat_zmanim
    Rzman::Zmanim.shabbat_time
    puts "Do you want to go back to the main menu? (y/n):".colorize(:light_cyan)
    choice = gets.strip
    if choice == "y"
      menu
    else
      goodbye
    end
  end

  def goodbye
    puts "Happy davening!".colorize(:light_blue)
    puts "RZman brought to you by Rabbi Ben Greenberg.".colorize(:light_blue)
    exit
  end
end
