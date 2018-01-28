class HundredBestIgs::CLI

  def call
    list_accounts
    menu
    goodbye
  end

  def list_accounts
    puts "100 Best Instagram Accounts:"
    puts ""
    #list all 100 ig accounts
    HundredBestIgs::BestIgs.new
    @best_igs = HundredBestIgs::BestIgs.all
    #binding.pry
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

      if input.to_i.between?(1, 100)
        best_ig = @best_igs[input.to_i - 1]
        #binding.pry unless best_ig

        puts "#{best_ig.name} - #{best_ig.posts} posts - #{best_ig.followers} followers - #{best_ig.following} following"
        puts "#{best_ig.summary}"
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
