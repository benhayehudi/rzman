class Rzman::Zmanim < Rzman::CLI
  attr_accessor :sunrise, :midday, :minha_gedolah, :plag_haminha, :sunset, :nightfall, :url, :shabbat_input
  def initialize
    @url = url
  end

  def self.today
    # should return today's Zmanim
    # zmanim_today = self.new
    # zmanim_today.sunrise = "sunrise"
    # zmanim_today.midday = "midday"
    # zmanim_today.minha_gedolah = "minha gedolah"
    # zmanim_today.plag_haminha = "plag haminha"
    # zmanim_today.sunset = "sunset"
    # zmanim_today.nightfall "nightfall"
    # zmanim_today.url = "url"
    # zmanim_today
    puts "Happy davening!"
    exit
  end

  def self.shabbat_time
    Rzman::Scraper.scrape_shabbat_times
    puts "#{@times_parsed}"
    puts "Shabbat Shalom!"
    exit
  end

end
