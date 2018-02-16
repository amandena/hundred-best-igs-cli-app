class HundredBestIgs::CLI

  def call
    list_accounts
    menu
    goodbye
  end

  def list_accounts
    puts "Rolling Stones' 100 Best Instagram Accounts:"
    puts ""

    @best_igs = HundredBestIgs::BestIgs.all
    @best_igs.each.with_index(1) do |ig, i|
      puts "#{i}. #{ig.name} - #{ig.posts} posts - #{ig.followers} followers - #{ig.following} following"
    end
  end

  def menu
    input = nil
    while input != "exit"

      puts ""
      puts "Enter the number of the account you'd like more info on:"
      puts "OR type 'list' to see all acounts again or type 'exit'."
      puts ""

      input = gets.strip.downcase
      best_ig_rank = HundredBestIgs::BestIgs.find_by_rank(input.to_i)

      if input.to_i.between?(1, 100)

        puts ""
        puts "#{best_ig_rank.name} - #{best_ig_rank.posts} posts - #{best_ig_rank.followers} followers - #{best_ig_rank.following} following"
        puts ""
        puts "#{best_ig_rank.summary}"

      elsif input == "list"
        list_accounts

      else
        puts "Not sure what you mean, please type 'list' or 'exit'."
      end
    end
  end

  def goodbye
    puts "Goodbye! Come back soon!"
  end
end
