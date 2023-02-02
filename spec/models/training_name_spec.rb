require 'rails_helper'

RSpec.describe 'TrainingNameモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(TrainingName.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Genreモデルとの関係' do
      it 'N:1となっている' do
        expect(TrainingName.reflect_on_association(:genre).macro).to eq :belongs_to
      end
    end

    context 'TrainingMenuモデルとの関係' do
      it '1:Nとなっている' do
        expect(TrainingName.reflect_on_association(:training_menus).macro).to eq :has_many
      end
    end
  end
end