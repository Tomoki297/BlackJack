class Card

# カードオブジェクトの値受け取り
  def initialize(mark, number)
    @mark = mark
    @number = number
  end

# カードの値表示
  def show
    return "#{@mark}の#{@number}"
  end

# J,Q,Kを10扱いにする
  def point
    if @number == "J" || @number == "Q" || @number == "K"
      return @number = 10
    else
      return @number.to_i
    end
  end

end

class Dealer < Card

  def initialize
    @dealer_hands = []
  end

# 一枚ドローする
  def dealer_one_drow(deck, dealer)
    card = deck.drow
    @dealer_hands.push(card)
    puts "ディーラーが引いたカードは#{card.show}です"
  end

# カードの得点を計算する（カードの合計）
  def dealer_score
    dealer_score = 0
    @dealer_hands.each do |hand|
      dealer_score += hand.point
    end
    return dealer_score
  end

# ディーラーが最初に引くカード一枚
  def first_drow_two_dealer(deck)
    2.times do
      card = deck.drow
      @dealer_hands.push(card)
    end

    puts "---ディーラーの手札---"
    puts "1枚目:#{@dealer_hands.first.show}"
    puts "2枚目は公開されません"
    puts "----------------------"
  end

# ディーラーの２枚目の手札公開
  def second_hands
    puts "ディーラーの2枚目は#{@dealer_hands.last.show}でした"
    puts "----------------------"
  end

  def dealer_drow(deck, dealer)
    card = deck.drow
    @dealer_hands.push(card)
    puts "ディーラーはカードを引きました"
  end

end
# Player
class Player < Card
# 手札
  def initialize
    @player_hands = []
  end
# 一枚ドローする
  def player_one_drow(deck, player)
    card = deck.drow
    @player_hands.push(card)
    puts "----------------------"
    puts "プレイヤーが引いたカードは#{card.show}です"
    puts "----------------------"
    puts "プレイヤーの現在の手札"
    @player_hands.each_with_index do |hand, i|
      puts "[#{hand.show}]"
    end
    puts "----------------------"
  end

# カードの得点を計算する（カードの合計）
  def player_score
    player_score = 0
    @player_hands.each do |hand|
      player_score += hand.point
    end
    return player_score
  end

# プレイヤーが初めにドローするカード二枚&手札公開
  def first_drow_two_player(deck)
    2.times do
      card = deck.drow
      @player_hands.push(card)
    end

    puts "---プレイヤーの手札---"
    @player_hands.each.with_index(1) do |hand, i|
      puts "#{i}枚目:#{hand.show}"
    end
  end

end
