require 'rails_helper'

RSpec.describe 'Favoriteモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Tweetモデルとの関係' do
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:tweet).macro).to eq :belongs_to
      end
    end
  end
end