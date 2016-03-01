require 'rails_helper'

describe 'user login', js: true do
  context "when user move root path and click 'Twitterでログイン'" do
    context "and can successful login with Twitter" do
      before do
        visit root_path
        click_link 'Twitterでログイン'
      end
      it 'return root path' do
        expect(page.current_path).to eq root_path
      end
      it 'page have "ログインしました"' do
        expect(page).to have_content 'ログインしました'
      end
    end
  end
end
