class EngineBackendService
  BASE_URL = 'http://localhost:3000/api/v1'

  def self.get_all_merchants
    response = Faraday.get("#{BASE_URL}/merchants")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_one_merchant(merchant_id)
    response = Faraday.get("#{BASE_URL}/merchants/#{merchant_id}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_merchant_items(merchant_id)
    response = Faraday.get("#{BASE_URL}/merchants/#{merchant_id}/items")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_all_items
    response = Faraday.get("#{BASE_URL}/items")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_one_item(item_id)
    response = Faraday.get("#{BASE_URL}/items/#{item_id}")

    JSON.parse(response.body, symbolize_names: true)
  end

end