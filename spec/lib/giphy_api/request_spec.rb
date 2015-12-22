describe GiphyApi::Request do
  describe '#get', :vcr do
    let(:path) { '/v1/gifs/feqkVgjJpYtjy' }

    it 'returns body response' do
      expect(subject.get(path)).to include('"id":"feqkVgjJpYtjy"')
    end
  end
end
