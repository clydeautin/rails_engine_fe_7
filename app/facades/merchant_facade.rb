class MerchantFacade
  def initialize()

  end

  def all_merchants
    json = EngineBackendService.get_all_merchants

    json[:data].map do |merchant_data|
      Merchant.new(merchant_data[:attributes])
    end
  end
end