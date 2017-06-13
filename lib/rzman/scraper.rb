class Rzman::Scraper
# Go to Chabad.org
# get zmanim for zipcode and date
# end up with array of data i.e. [sunrise, shkiah, etc.]
# Make a new zman instance with data

  @@zman_info = []

  def self.scrape_zmanim_today
    doc = Nokogiri::HTML(open("http://www.chabad.org/calendar/zmanim_cdo/jewish/Halachic-Times.htm#locationId=#{@zipcode}&locationType=2&tdate=#{@d}"))
    sunrise = doc.search(".large")[0].text
    binding.pry
  end

  # def self.scrape_zmanim_date
  # end

end
