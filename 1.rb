require 'pry'

def init
  number=['2','3','4','5','6','7','8','9','10','J','Q','K']
	suit=['H','D','S','C']
	card= number.product(suit)
	card.shuffle!
  mycard=[]
	dealercard=[]
	mycard<<card.pop
	dealercard<<card.pop
	mycard<<card.pop
	dealercard<<card.pop
	[dealercard,mycard,card]
end


def total(card)
  total=0
  cardnumer=[]
  cardnumercopy=[]
  cardnumer=card.map {|x| x[0]}
  cardnumercopy=card.map {|x| x[0]}
  cardnumer.each do |v|
    if v=="A"
      total+=11
    elsif v=="J" || v=="Q" || v=="K"
      total+=10
    else
      total+=v.to_i
    end
  end
   
  while total>21 && cardnumercopy.include?("A")
    total-=10
    cardnumer.delete_at(cardnumercopy.index("A"))
  end
  total		
end


def dealer_hit
	while total(dealercard)<17
		dealercard<<card.pop
	end
	if total(dealercard)>21
		puts "You win."
	else
		if total(dealercard)>total(mycard)
			puts "Dealer win."
		else
			puts "You win."
		end
	end
end


def show_condition(dealercard,mycard)
	stand_hit=""
	dealertotal=total(dealercard)
	mytotal=total(mycard)
	puts "Dealer"dealercard
	puts "You have: #{mycard[0]} and #{mycard[1]}, for a total of: #{mytotal}"
	puts 'Do you want to: 1)stand 2)hit'
end

def get_condition
	stand_hit=gets.chomp
end


puts "Welcome to blackjack!"
dealercard=[]
mycard=[]
card=[]
dealercard,mycard,card=init
show_condition(dealercard,mycard)
get_condition
while total(mycard)<21
  if get_condition=='1'
	  dealer_hit()
  else	 
    mycard<<card.pop
	  show_condition(dealercard,mycard)
	  get_condition
	end
end

if total(mycard)==21
	puts "You win."
else
	puts "You lose."
end








