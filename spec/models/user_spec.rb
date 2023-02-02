require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do

  describe 'モデルテスト' do
   it "有効な投稿内容の場合は保存されるか" do
    expect(FactoryBot.build(:user)).to be_valid
   end
  end

  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nicknameカラム' do
      it '空欄でないこと' do
        user.nickname = ''
        is_expected.to eq false
      end
      it '一意性があること' do
        user.nickname = other_user.nickname
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '5文字以上であること: 5文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 5)
        is_expected.to eq true
      end
      it '5文字以上であること: 4文字は×' do
        user.introduction = Faker::Lorem.characters(number: 4)
        is_expected.to eq false
      end
    end

    context 'prefectureカラム' do
      it '空欄でないこと' do
        user.prefecture = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Genreモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:genres).macro).to eq :has_many
      end
    end
    context 'Training_nameモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:training_names).macro).to eq :has_many
      end
    end
    context 'Training_menuモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:training_menus).macro).to eq :has_many
      end
    end
    context 'Tweetモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:tweets).macro).to eq :has_many
      end
    end
    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many
      end
    end
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end
    context 'Reportモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:reports).macro).to eq :has_many
      end
    end
  end
end
