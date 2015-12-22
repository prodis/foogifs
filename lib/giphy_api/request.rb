class GiphyApi::Request
  def get(path, options = {})
    response = RestClient.get(url_for(path), params: params_for(options))
    response.body
  end

  private

  def url_for(path)
    #TODO: Move to configuration
    "http://api.giphy.com/#{path}"
  end

  def params_for(options)
    #TODO: Move to configuration
    options.merge(api_key: 'dc6zaTOxFJmzC')
  end
end
