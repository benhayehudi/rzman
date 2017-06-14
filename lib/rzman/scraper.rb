
class Rzman::Scraper < Rzman::CLI

#   def self.scrape_zmanim_today
#     doc = Nokogiri::HTML(open("http://www.hebcal.com/shabbat/browse/united-states"))
#
# end

  def self.scrape_shabbat_times
    doc = Nokogiri::HTML(open("http://www.myjewishlearning.com/article/shabbat-candle-lighting-times/?zip=#{@@zip_input}"))
    @times_parsed = []

  doc.css(".m-message").each do |c|
    @times_parsed << {
      :location => c.css("p").first.text,
      :time => c.css("p").css("strong").first.text
    }
    end
    puts "Shabbat in #{@times_parsed[0][:location]}:"
    puts "#{@times_parsed[0][:time]}"
  end



end
