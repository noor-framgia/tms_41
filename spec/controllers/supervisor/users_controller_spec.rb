require "rails_helper"

describe Supervisor::UsersController do
  let(:supervisor){FactoryGirl.create :supervisor}
  before do
    sign_in supervisor
    allow(controller).to receive(:current_user).and_return supervisor
  end

  describe "GET index" do
    before {get :index}
    context "Get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status :ok}
      it {expect(response).to render_template :index}
    end
    it "populates list of users" do
      expect(assigns(:users)).to include supervisor
    end
  end

  describe "GET #show" do
    context "Get Show successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status :ok}
      it "renders the :show template" do
        get :show, id: supervisor
        expect(response).to render_template :show
      end
    end
  end

  describe "can DELETE #destroy" do
    it "delete" do
      delete :destroy , id: supervisor.id
      expect(User.find_by(id: supervisor.id)).to eq nil
      expect(response.redirect?).to be_truthy
    end
  end
end