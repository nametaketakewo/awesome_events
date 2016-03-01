require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  describe "GET #new" do
    context "when accessed by not logged in user" do
      before { get :new }
      it 'rediretc to root path' do
        expect(response).to redirect_to(root_path)
      end
    end
    context "when accessed by logged in user" do
      before do
        user = create :user
        session[:user_id] = user.id
        get :new
      end
      it 'returned status code is 200' do
        expect(response.status).to eq(200)
      end
      it 'new event object is into @event' do
        expect(assigns(:event)).to be_a_new(Event)
      end
      it 'render new template' do
        expect(response).to render_template :new
      end
    end
  end
end
