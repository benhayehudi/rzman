
class Rzman::Scraper < Rzman::CLI

  def self.scrape_zmanim_today
    doc = Nokogiri::HTML(open("https://www.myzmanim.com/day.aspx?askdefault=1&vars=US#{@@zip_input}"))
    @zmanim_parsed = []

    doc.css("center").each do |z|
      @zmanim_parsed << {
        :sunrise_name => z.css("tr:nth-of-type(7) td:nth-of-type(1) strong").text,
        :sunrise => z.css("tr:nth-of-type(8) td:nth-of-type(2) span:nth-of-type(1)").text,
        :midday_name => z.css("tr:nth-of-type(17) td:nth-of-type(1) strong").text,
        :midday => z.css("tr:nth-of-type(17) td:nth-of-type(2) span:nth-of-type(1)").text,
        :minha_gedolah_name => z.css("tr:nth-of-type(19) td:nth-of-type(1) strong").text,
        :minha_gedolah => z.css("tr:nth-of-type(20) td:nth-of-type(2) span:nth-of-type(1)").text,
        :plag_haminha_name => z.css("tr:nth-of-type(22) td:nth-of-type(1) strong").text,
        :plag_haminha => z.css("tr:nth-of-type(23) td:nth-of-type(2) span:nth-of-type(1)").text,
        :nightfall_name => z.css("tr:nth-of-type(28) td:nth-of-type(1) strong").text,
        :nightfall => z.css("tr:nth-of-type(29) td:nth-of-type(2) span:nth-of-type(1)").text
      }
    end
    puts " "
    puts "Your Zmanim:".colorize(:light_red)
    puts "Sunrise: #{@zmanim_parsed[0][:sunrise]}".colorize(:cyan)
    puts "Midday: #{@zmanim_parsed[0][:midday]}".colorize(:cyan)
    puts "#{@zmanim_parsed[0][:minha_gedolah_name]}: #{@zmanim_parsed[0][:minha_gedolah]}".colorize(:cyan)
    puts "#{@zmanim_parsed[0][:plag_haminha_name]}: #{@zmanim_parsed[0][:plag_haminha]}".colorize(:cyan)
    puts "#{@zmanim_parsed[0][:nightfall_name]}: #{@zmanim_parsed[0][:nightfall]}".colorize(:cyan)
  end

  def self.scrape_shabbat_times
    doc = Nokogiri::HTML(open("http://www.myjewishlearning.com/article/shabbat-candle-lighting-times/?zip=#{@@zip_input}"))
    @times_parsed = []

  doc.css(".m-message").each do |c|
    @times_parsed << {
      :location => c.css("p").first.text,
      :time => c.css("p").css("strong").first.text
    }
    end
    puts " "
    puts "Shabbat in #{@times_parsed[0][:location]}:".colorize(:light_red)
    puts "#{@times_parsed[0][:time]}".colorize(:cyan)
  end



end
