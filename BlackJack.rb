require './Deck'
require './Play'
require './Money'

# ゲームの開始・進行
def start_game
  puts "ゲームを開始します"
  puts "山札を作成しています"
  # newメソッドはinitializeメソッドを読んでいる
  deck = Deck.new
　# shuffleメソッドの呼び出し
  deck.shuffle
# playerの手札作成
  player = Player.new
　# 引数に(deck)を代入しfirst_drow_two_playerメソッドの呼び出し
  player.first_drow_two_player(deck)
# dealerの手札作成
  dealer = Dealer.new
  # 引数に(deck)を代入しfirst_drow_two_dealerメソッドの呼び出し
  dealer.first_drow_two_dealer(deck)
# playerのターン
  puts "プレイヤーのターンです"
  while true do
    choice = gets.chomp
    if choice == "H" || choice == "h"
      puts "Hitしました"
      puts "カードを一枚引きます"
      # 引数に(deck,player)を指定し、player_one_drowメソッドの呼び出し
      player.player_one_drow(deck, player)
      # プレイヤーがburstしたかどうかの判定
      unless burst?(player)
        exit
      end
      # プレイヤーがblackjackかどうかの判定
      unless blackjack?(player)
        break
      end
    elsif choice == "S" || choice == "s"
      puts "Standしました"
      puts "ディーラーのターンに移ります"
      break
    else
      puts "正しく入力してください(H or S)"
    end
  end
# dealerのターン
puts "----------------------"
puts "ディーラーのターンです"
# ディーラーの２枚目の手札公開
dealer.second_hands()
while true do
  # 引数に(deck, dealer)を指定し、dealer_one_drowメソッドの呼び出し
  dealer.dealer_one_drow(deck, dealer)
  # ディーラーのスコアが17を超えた場合の処理
  if dealer.dealer_score > 17
    puts "----------------------"
    break
  end
end
# 勝敗の判定
  puts "お互いカードを引き終えました"
  puts "Enterキーをおしてください"
  while true do
    # 処理が全て勝手に流れてしまうのでEnterキーの入力で意図的に結果を見ることができる
    enter = gets.chomp
    if enter == ""
      # 勝敗の判定に移る
      judge(player, dealer)
      break
    else
      puts "Enterキーをおしてください"
    end
  end
end

def judge(player,dealer)
  p_score = player.player_score
  d_score = dealer.dealer_score

  puts "プレイヤーの得点は#{p_score}です!!!"
  puts "ディーラーの得点は#{d_score}です!!!"

  if d_score == p_score
    puts "引き分けです"
  elsif d_score < p_score
    puts "プレイヤーの勝ちです!!"
  elsif d_score > p_score && d_score <= 21
    puts "プレイヤーの負けですTT"
  elsif p_score == 21 && d_score != 21
    puts "すごい！！！ブラックジャックだ！！！"
    puts "プレイヤーの勝ちです"
  elsif p_score == 21 && d_score == 21
    puts "お互いにブラックジャックだ！！！"
    puts "すごい奇跡だ..."
  elsif d_score > 21
    puts "ディーラーがバーストしました"
    puts "プレイヤーの勝ちです"
  end
end

def burst?(player)
  if player.player_score <= 21
    return true
  else
    puts "プレイヤーの得点が21を超えました"
    puts "プレイヤーの負けです"
    puts "ゲームを終了します"
    return false
  end
end

def blackjack?(player)
  if player.player_score == 21
    return false
  else
    return true
  end
end
puts "★★★★★★ブラックジャック★★★★★★"
start_game
