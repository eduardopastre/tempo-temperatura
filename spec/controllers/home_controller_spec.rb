require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    context "without cookie location" do
      it "cookie location should be created with user location" do  
        cookies.delete :location
        get :index
        expect(cookies[:location]).not_to be(nil)
      end
    end

    context "with cookie location" do
      it "shouldn't be nil" do
        cookies[:location] = "Bauru"
        get :index
        expect(cookies[:location]).not_to be(nil)
      end

      it "shouldn't be changed" do
        cookies[:location] = "Bauru"
        get :index
        expect(cookies[:location]).to eq("Bauru")
      end
    end
  end

end
