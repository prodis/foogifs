class GiphyApi::Client
  def self.search(keywords, options = {})
    self.new.search(keywords, options)
  end

  def initialize(args = {})
    @request = args[:request]
    @parser = args[:parser]
  end

  def search(keywords, options = {})
    response = request.get('/v1/gifs/search', options.merge(q: keywords))
    parser.parse(response)
  end

  private

  def request
    @request ||= GiphyApi::Request.new
  end

  def parser
    @parser ||= GiphyApi::Parser.new
  end
end

