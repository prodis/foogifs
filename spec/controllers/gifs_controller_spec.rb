describe GifsController do
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET index' do
    let!(:gifs) { create_list(:gif, 2, user: user) }
    let(:expected_json) do
      {
        gifs: gifs.map do |gif|
          {
            id: gif.id, giphy_id: gif.giphy_id,
            url: gif.url,
            tag_list: []
          }
        end
      }.to_json
    end

    it 'renders gifs' do
      get :index
      expect(response.body).to eq expected_json
    end
  end

  describe 'POST create' do
    let(:params) do
      {
        giphy_id: '7a8d8d9',
        url: 'http://img.com/img.gif',
        tag_list: 'one, two, three'
      }
    end

    it 'creates new gif' do
      post :create, gif: params

      gif = Gif.find_by(giphy_id: params[:giphy_id])
      expect(gif.url).to eq params[:url]
      expect(gif.tag_list.join(', ')).to eq params[:tag_list]
    end

    it 'returns 201 Created' do
      post :create, gif: params
      expect(response).to have_http_status(:created)
    end
  end
end
