# frozen_string_literal: true

require "forwardable"
require "item"

class NormalItem < Item
  def update
    item.quality = if item.quality == 0
      0
    elsif item.sell_in <= 0
      item.quality - 2
    else
      item.quality - 1
    end

    item.sell_in -= 1

    self
  end
end
