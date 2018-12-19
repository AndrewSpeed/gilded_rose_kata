# frozen_string_literal: true

require "aged_brie_item"
require "backstage_passes_item"
require "normal_item"
require "sulfuras_item"

DEFAULT_PRODUCT = Product
PRODUCT_CLASS_MAPPING = {
  "NORMAL ITEM" => NormalItem,
  "Aged Brie" => AgedBrieItem,
  "Sulfuras, Hand of Ragnaros" => SulfurasItem,
  "Backstage passes to a TAFKAL80ETC concert" => BackstagePassesItem
}.freeze

def update_quality(items)
  items.map do |item|
    item_wrapper = klass_for(item.name).new(item.quality, item.sell_in)
    item_wrapper.update
  end
end

def klass_for(item_name)
  PRODUCT_CLASS_MAPPING.fetch(item_name, DEFAULT_PRODUCT)
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
