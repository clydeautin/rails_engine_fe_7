class MerchantFacade
  def initialize()

  end

  def all_merchants
    json = EngineBackendService.get_all_merchants

    json[:data].map do |merchant_data|
      Merchant.new(merchant_data[:attributes])
    end
  end

  def one_merchant_by_id(merchant_id)
    json = EngineBackendService.get_one_merchant(merchant_id)

    Merchant.new(json[:data])
  end

  def merchant_items(merchant_id)
    json = EngineBackendService.get_merchant_items(merchant_id)

    json[:data].map do |item_data|
      Item.new(item_data)
    end
  end
end