require "forwardable"

class NormalItem
  attr_reader :item
  extend Forwardable

  def_delegator @item, :quality, :sell_in

  def initialize(item)
    @item = item
  end

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
