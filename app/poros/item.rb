class Item
  attr_reader :name, :id, :description, :unit_price, :merchant_id

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @description = data[:description]
    @unit_price = data[:unit_price]
    @merchant_id = data[:merchant_id]
  end
end