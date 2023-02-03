require 'rails_helper'

RSpec.describe 'TrainingMenuモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(TrainingMenu.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Genreモデルとの関係' do
      it 'N:1となっている' do
        expect(TrainingMenu.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end

    context 'TrainingNameモデルとの関係' do
      it 'N:1となっている' do
        expect(TrainingMenu.reflect_on_association(:training_name).macro).to eq :belongs_to
      end
    end
  end
end