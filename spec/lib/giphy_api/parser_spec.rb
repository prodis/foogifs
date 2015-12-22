describe GiphyApi::Parser do
  describe '#parse' do
    let(:response) do
      %({
        "data":[
          {"type":"gif","id":"x8a03o", "images":{"fixed_height":{"url":"http://img.com/img.gif"}}},
          {"type":"gif","id":"x9a41o", "images":{"fixed_height":{"url":"http://img.com/gif.gif"}}}
        ]
      })
    end
    let(:expected_result) do
      [
        { giphy_id: 'x8a03o', url: 'http://img.com/img.gif' },
        { giphy_id: 'x9a41o', url: 'http://img.com/gif.gif' }
      ]
    end

    it 'parsers raw response' do
      expect(subject.parse(response)).to eq expected_result
    end
  end
end
