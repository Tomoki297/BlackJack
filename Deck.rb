class Deck

# カードの生成
  def initialize
    @card_deck = []
    for mark in ["♣︎", "♦︎", "❤︎", "♠︎"]
      for number in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q","K"]
        # デッキの生成（５２枚）
        cards = Card.new(mark, number)
        @card_deck.push(cards)
      end
    end
  end

# カードのシャッフル
  def shuffle
    # デッキのシャッフル
    @card_deck.shuffle!
  end

# カードを引く・引かれたカードを山札から除外
  def drow
    # 末尾から要素を取り出す
    @card_deck.pop
  end

end
