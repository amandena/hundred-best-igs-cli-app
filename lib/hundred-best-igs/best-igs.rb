class HundredBestIgs::BestIgs

  attr_accessor :name, :summary, :posts, :followers, :following, :follow_url

  @@all = []

  def initialize(name = nil, follow_url = nil)
    @name = name
    @follow_url = follow_url
    @@all << self
  end

  def self.all
    #@@all
    #scrape rolling stones website and return account info
    self.scrape_igs

    #best_1 = self.new
    #best_1.name = "kimkardashian"
    #best_1.posts = "2747"
    #best_1.followers = "34.4m"
    #best_1.following = "94"

    #best_2 = self.new
    #best_2.name = "natgeo"
    #best_2.posts = "6775"
    #best_2.followers = "20.3m"
    #best_2.following = "91"

    #[best_1, best_2]
  end

  def self.scrape_igs
    igs = []
    igs << self.scrape_rolling_stones
    igs
  end

  def self.scrape_rolling_stones
    doc = Nokogiri::HTML(open("https://www.rollingstone.com/culture/features/the-100-best-instagram-accounts#"))

    #add each method to go through and scrape info from all 100 accounts
    account = self.new
    account.name = doc.css("h1.account-name").last.text
    account.summary = doc.css(".account-body p").last.text
    account.posts = doc.css(".related.posts p").last.text
    account.followers = doc.css(".related.followers p").last.text
    account.following = doc.css(".related.following p").last.text
    account.follow_url = doc.css(".follow-button-container a").last.attr("href")

    account
  end

  def self.find_by_name(name)

  end

  def self.find_by_number(number)

  end
end
