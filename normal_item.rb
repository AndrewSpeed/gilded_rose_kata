# frozen_string_literal: true

require "item"

class NormalItem < Item
  def update
    if self.quality == 0
      self.quality = 0
    elsif self.sell_in <= 0
      self.quality -= 2
    else
      self.quality -= 1
    end

    self.sell_in -= 1

    self
  end
end
