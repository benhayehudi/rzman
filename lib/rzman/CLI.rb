# CLI Controller
require 'date'

class Rzman::CLI

  # @zipcode = []
  # @date = []

  def call
    puts "Today's Halakhic Zmanim"
    menu
    list_zmanim
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
    zipcode_input = nil
    date_input = nil
    while zipcode_input != "EXIT"
      puts "Please enter your zipcode:"
      zipcode_input = gets.strip
      @zipcode = nil
      @zipcode = zipcode_input
      puts "Enter the date you want to see zmanim/זמנים for. Please use this format '12/04/2017' or type 'TODAY' to see today's zmanim or EXIT:"
      @date = nil
      date_input = gets.strip.upcase
        # if date_input.include?('/')
        #   @date << date_input
        # end
      if date_input == "TODAY"
        @d = Date.today
        puts "Zmanim for #{@d}:"
        Rzman::Zmanim.today
      elsif date_input == "EXIT"
        goodbye
      elsif date_input.include?('/')
        @date = date_input
        puts "Zmanim for #{@date}:"
        Rzman::Zmanim.date
      else
        puts "Please try again."
      end
    end
  end

  def goodbye
    puts "Happy davening!"
    puts "יום טוב"
    exit
  end

end
