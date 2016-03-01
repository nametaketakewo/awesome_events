require 'rails_helper'

describe "login user express intent to join a event", js: true do
  let!(:event) { create :event }
  context "when login user click '参加する' in the event detail page" do
    before do
      visit root_path
      click_link 'Twitterでログイン'
      visit event_path, event
      click_on '参加する'
    end
    it 'modal window is appear' do
      expect(page.find('#createTicket')).to be_visible
    end
    context "and input a comment and click '送信'" do
      before do
        fill_in 'ticket_comment', with: 'I join it.'
        click_button '送信'
      end
      it 'show "このイベントに参加登録しました"' do
        expect(page).to have_content('このイベントに参加登録しました')
      end
      it 'show joined user name' do
        expect(page).to have_content('@nametaketakewo')
      end
    end
  end
end
