class AdoptADog::Dogs
  attr_accessor :name, :breed, :sex, :location, :url

  @@all = []

  def initialize(iggy_hash)
    @@all << iggy_array.each {|key, value| send(("#{key}="), value)}
  end

  def self.create_from_array(iggy_array)
    iggy_array.each do |hash|
      Dog.new(hash)
    end
  end

  def add_info(about_hash)
    about_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end

  # private
      # def self.scrape_dogs
      #   dogs = Nokogiri::HTML(open("https://www.petsmartcharities.org/find-a-pet-results?city_or_zip=21234&species=dog&color_id&geo_range=50&pet_size_range_id&sex&age=&breed_id=69"))
      #   iggy_array = []
      #
      #   dogs.css(".pet-result").each do |dog|
      #     iggy_array << {
      #       :name => dog.css(".pet-name").text,
      #       :breed => dog.css(".pet-breed").text,
      #       :sex => dog.css(".pet-sex").text,
      #       :location => dog.css(".pet-addr-city-state").text,
      #       :url => "https://www.petsmartcharities.org" + dog.css("a").attribute("href").value
      #     }
      #   end
      #   iggy_array
      # end

    def self.scrape_profile_page(url)
      # profile: profile.css(".pet-description").text
      # shelter name: profile.css(".pet-adoption-info").css(".shelter-name").text
      # website: profile.css(".pet-adoption-info").css(".website").text

      html = open(url)
      profile = Nokogiri::HTML(html)

      about = {}

      about[:story] = profile.css(".pet-description").text
      about[:shelter] = profile.css(".pet-adoption-info").css(".shelter-name").text
      about[:website] = profile.css(".pet-adoption-info").css(".website").text

      about

      # binding.pry
    end


end
