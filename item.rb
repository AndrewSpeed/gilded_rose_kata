class Item
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def quality
    item.quality
  end

  def quality=(new_quality)
    item.quality = new_quality
  end

  def sell_in
    item.sell_in
  end

  def sell_in=(new_sell_in)
    item.sell_in = new_sell_in
  end

  def update
    self
  end
end
