require "item"

class AgedBrieItem < Item
  def update
    if sell_in <= 0
      self.quality += 2
    elsif sell_in > 0
      self.quality += 1
    end
    self.quality = 50 if quality >= 50

    self.sell_in -= 1

    self
  end
end
