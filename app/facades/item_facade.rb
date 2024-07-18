class ItemFacade

  def initialize()

  end

  def all_items
    json = EngineBackendService.get_all_items

    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end

  def one_item_by_id(item_id)
    json = EngineBackendService.get_one_item(item_id)
    # require 'pry'; binding.pry
    Item.new(json[:data])
  end
end