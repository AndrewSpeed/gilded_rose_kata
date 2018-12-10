require "forwardable"

class Item
  attr_reader :item
  extend Forwardable

  def_delegator @item, :quality, :sell_in

  def initialize(item)
    @item = item
  end

  def update
    self
  end
end
