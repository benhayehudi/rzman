class Rzman::Zmanim < Rzman::CLI

  attr_accessor :sunrise_name, :sunrise, :midday_name, :midday, :minha_gedolah_name, :minha_gedolah, :plag_haminha_name, :plag_haminha, :sunrise_name, :sunset, :nightfall_name, :nightfall

  def self.zmanim_today
    Rzman::Scraper.scrape_zmanim_today
    puts " "
    puts "Zmanim courtesy of MyZmanim.com".colorize(:yellow)
    puts "Happy davening!".colorize(:yellow)
  end

  def self.shabbat_time
    Rzman::Scraper.scrape_shabbat_times
    puts " "
    puts "Shabbat times courtesy of MyJewishLearning.com.".colorize(:yellow)
    puts "Shabbat Shalom!".colorize(:yellow)
  end
end
