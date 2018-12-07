require "forwardable"

class Normal
  attr_reader :item
  extend Forwardable

  def_delegator @item, :quality, :sell_in

  def initialize(item)
    @item = item
  end

  def update
    @item.quality = if @item.quality == 0
      0
    elsif @item.sell_in <= 0
      @item.quality - 2
    else
      @item.quality - 1
    end

    @item.sell_in -= 1

    self
  end
end

class AgedBrie
  attr_reader :item
  extend Forwardable

  def_delegator @item, :quality, :sell_in

  def initialize(item)
    @item = item
  end

  def update
    if @item.sell_in <= 0
      @item.quality = @item.quality + 2
    elsif @item.sell_in > 0
      @item.quality = @item.quality + 1
    end
    @item.quality = 50 if @item.quality >= 50

    @item.sell_in = @item.sell_in - 1

    self
  end
end

class Sulfuras
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

def update_quality(items)
  items.each do |item|
    case item.name
    when "NORMAL ITEM"
      normal_item = Normal.new(item)
      normal_item.update
    when "Aged Brie"
      aged_brie = AgedBrie.new(item)
      aged_brie.update
    when "Sulfuras, Hand of Ragnaros"
      sulfuras = Sulfuras.new(item)
      sulfuras.update
    when "Backstage passes to a TAFKAL80ETC concert"
      backstage_passes_item(item)
    end
  end
end

def backstage_passes_item(item)
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

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
