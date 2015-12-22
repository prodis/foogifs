describe Gif do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:giphy_id) }
    it { is_expected.to validate_presence_of(:url) }
  end
end
