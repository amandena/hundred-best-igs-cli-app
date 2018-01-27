class HundredBestIgs::BestIgs

  attr_accessor :name, :summary, :posts, :followers, :following, :follow_url

  @@all = []

  def initialize(name = nil, posts = nil, followers = nil, following = nil)
    @name = name
    @posts = posts
    @followers = followers
    @following = following
  end

  def self.all
    #binding.pry
    if @@all.empty?
      @@all = self.scrape
    else
      @@all
    end
    #scrape rolling stones website and return account info
  end

  def self.doc
    @@doc ||= Nokogiri::HTML(open("https://www.rollingstone.com/culture/features/the-100-best-instagram-accounts#"))
  end

  def self.scrape
    #add collect method to go through and scrape info from all 100 accounts
    accounts = []
    doc.css(".account").each do |a|

      account = self.new

      account.name = a.css("h1.account-name").last.text.strip
      account.summary = a.css(".account-body p").last.text.strip
      account.posts = a.css(".related.posts p").last.text.strip
      account.followers = a.css(".related.followers p").last.text.strip
      account.following = a.css(".related.following p").last.text.strip
      account.follow_url = a.css(".follow-button-container a").attr("href").value

      accounts.unshift(account)
    end
      binding.pry
  end

  def self.find_by_name(name)

  end

  def self.find_by_number(number)

  end
end
