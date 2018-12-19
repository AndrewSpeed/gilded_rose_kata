# frozen_string_literal: true

require "product"

class NormalItem < Product
  def update
    if quality == 0
      self.quality = 0
    elsif sell_in <= 0
      self.quality -= 2
    else
      self.quality -= 1
    end

    self.sell_in -= 1

    self
  end
end
