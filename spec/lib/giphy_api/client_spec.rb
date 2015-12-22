describe GiphyApi::Client do
  let(:request) { double(GiphyApi::Request) }
  let(:parser) { double(GiphyApi::Parser) }
  subject { described_class.new(request: request, parser: parser) }

  describe '#search' do
    let(:response) { double('response') }
    let(:result) { double('result') }

    before do
      allow(request).to receive(:get).with('/v1/gifs/search', q: 'akira', limit: 5).and_return(response)
      allow(parser).to receive(:parse).with(response).and_return(result)
    end

    it 'returns search result' do
      expect(subject.search('akira', limit: 5)).to eq result
    end
  end
end
