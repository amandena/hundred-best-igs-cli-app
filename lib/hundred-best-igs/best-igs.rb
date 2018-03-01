class HundredBestIgs::BestIgs

  attr_accessor :name, :rank, :summary, :posts, :followers, :following, :follow_url

  @@all = []

  def initialize(name = nil, rank = nil, posts = nil, followers = nil, following = nil)
    @name = name
    @rank = rank
    @posts = posts
    @followers = followers
    @following = following
  end

  def self.all
    if @@all.empty?
      @@all = self.scrape.reverse!
    else
      @@all.reverse!
    end
  end

  def self.doc
    @@doc ||= Nokogiri::HTML(open("https://www.rollingstone.com/culture/features/the-100-best-instagram-accounts#"))
  end

  def self.scrape
    doc.css(".account").collect do |a|

      account = self.new
      account.rank = a.css(".closed").last.text.strip
      account.name = a.css("h1.account-name").last.text.strip
      account.summary = a.css(".account-body p").last.text.strip
      account.posts = a.css(".related.posts p").last.text.strip
      account.followers = a.css(".related.followers p").last.text.strip
      account.following = a.css(".related.following p").last.text.strip
      account.follow_url = a.css(".follow-button-container a").attr("href").value

      account
    end
  end

  def self.find_by_rank(rank)
    self.all[rank-1]
  end
end
