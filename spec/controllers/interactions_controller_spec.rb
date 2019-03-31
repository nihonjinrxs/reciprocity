require 'rails_helper'
require 'pry'

RSpec.describe InteractionsController, type: :controller do
  before do
    user = User.create!(email: 'person@example.com', password: 'xyz123456', confirmed_at: Time.now)
    sign_in user
  end

  let(:participant) do
    Participant.create!(user: User.create!(email: 'jo@lala.com', password: 'qwerty', confirmed_at: Time.now))
  end

  let(:listing_creator) do
    Participant.create!(user: User.create!(email: 'jimmy@corporate.com', password: 'password', confirmed_at: Time.now))
  end

  let(:listing) do
    Listing.create!(creator: listing_creator, type: "Offering")
  end

  let(:interaction) do
    Interaction.create! valid_attributes
  end

  let(:valid_attributes) do
    {
      reciprocator_id: participant.id,
      listing_id: listing.id
    }
  end

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      interaction
      get :index, params: {}, session: valid_session
      expect(assigns(:interactions)).to eq([interaction])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      interaction = Interaction.create! valid_attributes
      get :show, params: {id: interaction.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      interaction = Interaction.create! valid_attributes
      get :edit, params: {id: interaction.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Interaction" do
        expect {
          post :create, params: {interaction: valid_attributes}, session: valid_session
        }.to change(Interaction, :count).by(1)
      end

      it "redirects to the created interaction" do
        post :create, params: {interaction: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Interaction.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {interaction: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested interaction" do
        interaction = Interaction.create! valid_attributes
        put :update, params: {id: interaction.to_param, interaction: new_attributes}, session: valid_session
        interaction.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the interaction" do
        interaction = Interaction.create! valid_attributes
        put :update, params: {id: interaction.to_param, interaction: valid_attributes}, session: valid_session
        expect(response).to redirect_to(interaction)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        interaction = Interaction.create! valid_attributes
        put :update, params: {id: interaction.to_param, interaction: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested interaction" do
      interaction = Interaction.create! valid_attributes
      expect {
        delete :destroy, params: {id: interaction.to_param}, session: valid_session
      }.to change(Interaction, :count).by(-1)
    end

    it "redirects to the interactions list" do
      interaction = Interaction.create! valid_attributes
      delete :destroy, params: {id: interaction.to_param}, session: valid_session
      expect(response).to redirect_to(interactions_url)
    end
  end

end
