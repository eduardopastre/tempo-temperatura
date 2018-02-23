require 'rails_helper'

RSpec.describe PrevisaoController, type: :controller do

  describe "GET #cidade" do

    context "With a valid city" do
      before(:each) do
        get :cidade, params: {city: "Bauru", state: "SP"}
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end

      it "set cookie location" do
        expect(cookies[:location]).to eq('Bauru')
      end
    end

    context "With a invalid city" do
      before(:each) do
        get :cidade, params: {city: "not exists", state: "aa"}
      end
      it "redirect to root path" do
        expect(response).to redirect_to(root_path)
      end

      it "display a flash notice" do
        expect(flash[:notice]).to match(/Desculpe, mas não foi possível obter daods para esta cidade no momento/)
      end
    end
  end

end
