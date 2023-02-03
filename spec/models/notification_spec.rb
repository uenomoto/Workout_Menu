require 'rails_helper'

RSpec.describe 'Notificationモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'PostCommentモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:post_comment).macro).to eq :belongs_to
      end
    end

    context 'Tweetモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:tweet).macro).to eq :belongs_to
      end
    end

    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:visitor).macro).to eq :belongs_to
      end
    end

    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Notification.reflect_on_association(:visited).macro).to eq :belongs_to
      end
    end
  end
end