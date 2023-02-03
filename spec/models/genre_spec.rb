require 'rails_helper'

RSpec.describe 'Genreモデルのテスト', type: :model do

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Genre.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'TrainingNameモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:training_names).macro).to eq :has_many
      end
    end

    context 'TrainingMenuモデルとの関係' do
      it '1:Nとなっている' do
        expect(Genre.reflect_on_association(:training_menus).macro).to eq :has_many
      end
    end
  end
end