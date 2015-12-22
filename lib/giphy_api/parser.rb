class GiphyApi::Parser
  def parse(response)
    result = JSON.parse(response)
    result["data"].map do |item|
      {
        giphy_id: item["id"],
        url: item["images"]["fixed_height"]["url"]
      }
    end
  end
end
