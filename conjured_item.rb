# frozen_string_literal: true

require "product"

class ConjuredItem < Product
  def update
    if self.quality == 0
      self.quality = 0
    elsif self.sell_in <= 0
      self.quality -= 4
    else
      self.quality -= 2
    end

    self.sell_in -= 1

    self
  end
end
