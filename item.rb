class Item
  attr_reader :item, :quality, :sell_in

  def self.new_with_item(item)
    new(item, item.quality, item.sell_in)
  end

  def initialize(item, quality, sell_in)
    @item = item
    @quality = quality
    @sell_in = sell_in
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
