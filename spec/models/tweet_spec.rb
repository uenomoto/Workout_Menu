require 'rails_helper'

RSpec.describe 'Tweetモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Tweet.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tweet.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end

    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tweet.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'Reportモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tweet.reflect_on_association(:reports).macro).to eq :has_many
      end
    end

    context 'Notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tweet.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end