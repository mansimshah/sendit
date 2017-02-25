require 'rails_helper'

RSpec.describe TransfersController, type: :controller do

  let(:transfer) { FactoryGirl.attributes_for(:transfer) }

  describe "GET new" do
    it "renders :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

end