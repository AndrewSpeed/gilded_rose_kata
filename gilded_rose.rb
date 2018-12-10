require "normal_item"
require "aged_brie_item"
require "sulfuras_item"
require "backstage_passes_item"

def update_quality(items)
  items.each do |item|
    case item.name
    when "NORMAL ITEM"
      normal_item = NormalItem.new(item)
      normal_item.update
    when "Aged Brie"
      aged_brie = AgedBrieItem.new(item)
      aged_brie.update
    when "Sulfuras, Hand of Ragnaros"
      sulfuras = SulfurasItem.new(item)
      sulfuras.update
    when "Backstage passes to a TAFKAL80ETC concert"
      backstage_passes = BackstagePassesItem.new(item)
      backstage_passes.update
    end
  end
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
