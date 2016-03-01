require 'rails_helper'

RSpec.describe "events/show", :type => :view do
  context "when accessed by not logged in user" do
    before do
      def view.logged_in?; end
      def view.current_user; end
      def view.new_event_ticket_path(e); end
      allow(view).to receive(:logged_in?) { false }
      allow(view).to receive(:current_user) { nil }
      allow(view).to receive(:new_event_ticket_path) { |e| 'http://dammy.com' }
    end
    context "and @event.owner is nil" do
      before do
        assign(:event, create(:event, owner: nil))
        assign(:tickets, [])
      end
      it 'displayed as "*このユーザーは退会しました*"' do
        render
        expect(rendered).to match /\*このユーザーは退会しました\*/
      end
    end
  end
end
