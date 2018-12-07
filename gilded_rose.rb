def update_quality(items)
  items.each do |item|
    if item.name == "NORMAL ITEM"
      normal_item(item)
    elsif item.name == "Aged Brie"
      aged_brie_item(item)
    elsif item.name == "Sulfuras, Hand of Ragnaros"
      sulfuras_item(item)
    elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
      backstage_passes_item(item)
    end
  end
end

def normal_item(item)
  item.sell_in = item.sell_in - 1

  item.quality = if item.quality == 0
    item.quality = 0
  elsif item.sell_in <= 0
    item.quality - 2
  else
    item.quality - 1
  end

  item
end

def aged_brie_item(item)
  item.sell_in = item.sell_in - 1

  if item.sell_in <= 0
    item.quality = item.quality + 2
  elsif item.sell_in > 0
    item.quality = item.quality + 1
  end
  item.quality = 50 if item.quality >= 50

  item
end

def sulfuras_item(item)
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
