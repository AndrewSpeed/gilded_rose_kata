# frozen_string_literal: true

require "item"

class NormalItem < Item
  def update
    self.quality = if quality == 0
      0
    elsif sell_in <= 0
      quality - 2
    else
      quality - 1
    end

    self.sell_in -= 1

    self
  end
end
