require 'rails_helper'

RSpec.describe Blog, type: :model do

  before do
    @blog = FactoryBot.build(:blog)
  end
  describe '#create' do
    context '内容に問題がある場合' do
      it 'titleが空では登録できないこと' do
        @blog.title = ''
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Title can't be blank")
      end

      it '内容が空では登録できないこと' do
        @blog.body = ''
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Body can't be blank")
      end

    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@blog).to be_valid
        end
      end
    end
  end
end
