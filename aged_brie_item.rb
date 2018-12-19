# frozen_string_literal: true

require "product"

class AgedBrieItem < Product
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
