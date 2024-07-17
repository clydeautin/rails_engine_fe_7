class EngineBackendService
  BASE_URL = 'http://localhost:3000/api/v1'

  def self.get_all_merchants
    response = Faraday.get("#{BASE_URL}/merchants")

    JSON.parse(response.body, symbolize_names: true)
  end
end