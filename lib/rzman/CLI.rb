# CLI Controller
require 'date'
require 'go_maps'

class Rzman::CLI

  def call
    puts "Welcome to RZman!".colorize(:light_green)
    menu
  end

  def list_zmanim
    #get Zmanim
  #   puts <<-DOC.gsub /^\s*/, ''
  #   a. Sunrise/הנץ החמה:
  #   b. Midday/חצות היום:
  #   c: Minha Gedolah/מנחה גדולה:
  #   d: Plag HaMinha/פלג המנחה:
  #   e: Sunset/שקיעת החמה:
  #   f: Nightfall (3 stars)/צאת ג׳ כוכבים:
  # DOC
  @zmanim = Rzman::Zmanim.today
end

  def menu
    puts "To discover your zmanim for the day or Shabbat candle lighting time please choose from the following:".colorize(:light_cyan)
    puts ""
    @first_choice = nil
    puts "1. Get my zmanim for the day".colorize(:light_yellow)
    puts "2. Get my candle lighting for this Shabbat".colorize(:light_yellow)
    puts ""
    puts "Please enter '1' or '2' or 'exit'".colorize(:light_cyan)
    @first_choice = gets.strip
    if @first_choice == "1"
      puts "Please enter a valid U.S. zipcode:".colorize(:light_cyan)
      @@zip_input = gets.strip.to_i
      get_zmanim
    elsif @first_choice == "2"
      puts "Please enter a valid U.S zipcode:".colorize(:light_cyan)
      @@zip_input = gets.strip.to_i
      get_shabbat_zmanim
    elsif @first_choice == "exit"
      puts "Bye! Thanks for using RZman!".colorize(:light_green)
      exit
    else
      return_to_menu
    end
  end

  def return_to_menu
    @first_choice != "1" || @first_choice != "2" || @first_choice != "exit"
    puts "Please enter a valid option."
    menu
  end

  def get_zmanim
    Rzman::Zmanim.zmanim_today
    puts "Do you want to go back to the main menu? (y/n):"
    choice = gets.strip
    if choice == "y"
      menu
    else
      goodbye
    end
  end

  def get_shabbat_zmanim
    Rzman::Zmanim.shabbat_time
    puts "Do you want to go back to the main menu? (y/n):"
    choice = gets.strip
    if choice == "y"
      menu
    else
      goodbye
    end
  end

  def goodbye
    puts "Happy davening!".colorize(:light_green)
    exit
  end

end
