describe SearchController do
  describe 'GET index' do
    let(:params) do
      { q: 'akira', limit: "5" }
    end
    let(:gifs) do
      [
        { giphy_id: 'x8a03o', url: 'http://img.com/img.gif' },
        { giphy_id: 'x9a41o', url: 'http://img.com/gif.gif' }
      ]
    end

    before do
      allow(GiphyApi::Client).to receive(:search).with('akira', limit: 5).and_return(gifs)
    end

    context 'when current user exists' do
      let(:user) { create(:user) }
      let(:expected_result) do
        result = { search: gifs }
        result[:search].first[:saved] = false
        result[:search].last[:saved] = true
        result.to_json
      end

      before do
        allow(controller).to receive(:current_user).and_return(user)
        create(:gif, giphy_id: 'x9a41o', url: 'http://img.com/gif.gif', user: user)
      end

      it 'returns gifs found marked as save or not' do
        get :index, params
        expect(response.body).to eq expected_result
      end
    end

    context 'when current user does not exists' do
      let(:expected_result) do
        { search: gifs }.to_json
      end

      it 'returns gifs found' do
        get :index, params
        expect(response.body).to eq expected_result
      end
    end
  end
end
