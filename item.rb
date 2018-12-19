class Item
  attr_reader :quality, :sell_in

  def initialize(quality, sell_in)
    @quality = quality
    @sell_in = sell_in
  end

  def update
    self
  end

  private

  attr_writer :quality, :sell_in
end
