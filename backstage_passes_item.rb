# frozen_string_literal: true

require "forwardable"
require "item"

class BackstagePassesItem < Item
  def update
    if item.sell_in > 10
      item.quality = item.quality + 1
    elsif item.sell_in > 5
      item.quality = item.quality + 2
    elsif item.sell_in >= 1
      item.quality = item.quality + 3
    elsif item.sell_in <= 0
      item.quality = 0
    end
    item.quality = 50 if item.quality > 50

    item.sell_in = item.sell_in - 1

    item
  end
end
