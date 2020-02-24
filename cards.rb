require "sinatra"

require "sinatra/reloader"

def view(template); erb template.to_sym; end

before { puts "Parameters: #{params}" }  



get "/" do

    deck = []

    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, "jack", "queen", "king", "ace"]

    suits = ["clubs", "diamonds", "hearts", "spades"]

  

    for rank in ranks

        for suit in suits

            deck << "#{rank}_of_#{suit}"

        end

    end

  

    shuffled_deck = deck.shuffle



    @poker_hand = shuffled_deck.slice(0, 5)



    view "cards"

end