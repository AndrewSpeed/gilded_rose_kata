# frozen_string_literal: true

require "item"

class BackstagePassesItem < Item
  def update
    if sell_in > 10
      self.quality = quality + 1
    elsif sell_in > 5
      self.quality = quality + 2
    elsif sell_in >= 1
      self.quality = quality + 3
    elsif sell_in <= 0
      self.quality = 0
    end
    self.quality = 50 if quality > 50

    self.sell_in = sell_in - 1

    self
  end
end
