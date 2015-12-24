require "rails_helper"

describe Supervisor::CoursesController do

  before do
    allow_any_instance_of(CanCan::ControllerResource).to receive(:authorize_resource)
  end

  describe "GET #index" do
    it "populates an array of all courses" do
      cse = create(:course, name: "CSE")
      eee = create(:course, name: "EEE")
      ce = create(:course, name: "CE")
      get :index
      expect(assigns(:courses)).to match_array([cse, eee, ce])
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  ## BELLOW CODE WILL BE IMPLEMENTED LATER. pLEASE DONT REMOVE


  # describe "GET #show" do
  #   it "assigns the requested contact to @contact"
  #   it "renders the :show template"
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new Contact to @contact"
  #   it "renders the :new template"
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested contact to @contact"
  #   it "renders the :edit template"
  # end
  #
  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "saves the new contact in the database"
  #     it "redirects to contacts#show"
  #   end
  #   context "with invalid attributes" do
  #     it "does not save the new contact in the database"
  #     it "re-renders the :new template"
  #   end
  # end
  #
  # describe "PATCH #update" do
  #   context "with valid attributes" do
  #     it "updates the contact in the database"
  #     it "redirects to the contact"
  #   end
  #   context "with invalid attributes" do
  #     it "does not update the contact"
  #     it "re-renders the :edit template"
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "deletes the contact from the database"
  #   it "redirects to users#index"
  # end
end