class Rzman::Zmanim < Rzman::CLI

  attr_accessor :sunrise_name, :sunrise, :midday_name, :midday, :minha_gedolah_name, :minha_gedolah, :plag_haminha_name, :plag_haminha, :nightfall_name, :nightfall

  @@zmanims = []

  def initialize(zmanim_hash)
    @sunrise_name = zmanim_hash[:sunrise_name]
    @sunrise = zmanim_hash[:sunrise]
    @midday_name = zmanim_hash[:midday_name]
    @midday = zmanim_hash[:midday]
    @minha_gedolah_name = zmanim_hash[:minha_gedolah_name]
    @minha_gedolah = zmanim_hash[:minha_gedolah]
    @plag_haminha_name = zmanim_hash[:plag_haminha_name]
    @plag_haminha = zmanim_hash[:plag_haminha]
    @nightfall_name = zmanim_hash[:nightfall_name]
    @nightfall = zmanim_hash[:nightfall]
    @@zmanims << self
  end

  def self.all
    @@zmanims
  end

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
