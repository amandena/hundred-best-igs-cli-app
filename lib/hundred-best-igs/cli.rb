class HundredBestIgs::CLI

  def call
    list_accounts
    menu
    goodbye
  end

  def list_accounts
    puts "100 Best Instagram Accounts:"
    #list all 100 ig accounts
    @best_igs = HundredBestIgs::BestIgs.all.name
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the account you'd like more info on, type 'list' to see all acounts again, or type 'exit':"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on account #1..."
      when "2"
        puts "More info on account #2..."
      when "3"
        puts "More info on account #3..."
      when "list"
        list_accounts
      when "exit"
        exit
      else
        puts "Not sure what you mean, please type 'list' or 'exit'."
      end
    end
    #use case statements to loop through the accounts based on input to return the correct info
  end

  def goodbye
    puts "Goodbye! Come back soon!"
  end
end
