require "forwardable"

class AgedBrieItem
  attr_reader :item
  extend Forwardable

  def_delegator @item, :quality, :sell_in

  def initialize(item)
    @item = item
  end

  def update
    if item.sell_in <= 0
      item.quality = item.quality + 2
    elsif item.sell_in > 0
      item.quality = item.quality + 1
    end
    item.quality = 50 if item.quality >= 50

    item.sell_in = item.sell_in - 1

    self
  end
end
