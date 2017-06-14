# CLI Controller
require 'date'

class Rzman::CLI

  @@shabbat_input = ""
  attr_accessor :shabbat_input

  # @zipcode = []
  # @date = []

  def call
    puts "Welcome to RZman!"
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


  # def menu
  #   zipcode_input = nil
  #   date_input = nil
  #   while zipcode_input != "EXIT"
  #     puts "Please enter your zipcode:"
  #     zipcode_input = gets.strip
  #     @zipcode = nil
  #     @zipcode = zipcode_input
  #     puts "Enter the date you want to see zmanim/זמנים for. Please use this format '12/04/2017' or type 'TODAY' to see today's zmanim or EXIT:"
  #     @date = nil
  #     date_input = gets.strip.upcase
  #       # if date_input.include?('/')
  #       #   @date << date_input
  #       # end
  #     if date_input == "TODAY"
  #       @d = Date.today
  #       puts "Zmanim for #{@d}:"
  #       Rzman::Zmanim.today
  #     elsif date_input == "EXIT"
  #       goodbye
  #     elsif date_input.include?('/')
  #       @date = date_input
  #       puts "Zmanim for #{@date}:"
  #       Rzman::Zmanim.date
  #     else
  #       puts "Please try again."
  #     end
  #   end
  # end

  def menu
    puts "To discover your zmanim for the day or Shabbat candle lighting time please choose from the following:"
    puts ""
    first_choice = nil
    puts "1. Get my zmanim for the day"
    puts "2. Get my candle lighting for this Shabbat"
    puts ""
    puts "Please enter '1' or '2' or 'exit'"
    first_choice = gets.strip
    if first_choice == "1"
      puts "Your zmanim for the day:"
    elsif first_choice == "2"
      puts "Please type in your zipcode:"
      @@zip_input = gets.strip.to_i
      # @@shabbat_input.split(/ |\_/).map(&:capitalize).join(" ")
      Rzman::Zmanim.shabbat_time
    elsif first_choice == "exit"
      puts "Bye! Thanks for using RZman!"
      exit
    else
      puts "Please enter a valid option."
    end
  end



  def goodbye
    puts "Happy davening!"
    puts "יום טוב"
    exit
  end

end
