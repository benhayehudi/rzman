
class Rzman::Scraper < Rzman::CLI

#   def self.scrape_zmanim_today
#     doc = Nokogiri::HTML(open("http://www.hebcal.com/shabbat/browse/united-states"))
#
# end

  def self.scrape_shabbat_times
    doc = Nokogiri::HTML(open("http://www.hebcal.com/shabbat/browse/united-states"))
    @times_parsed = []
    doc.css(".col-sm-3").css("li").each do |times|
      @times_parsed << {
       :city => times.css("a").text,
       :time => times.xpath('///a/following-sibling::text()').text
      }
      binding.pry
    end
    @times_parsed
  end



end
