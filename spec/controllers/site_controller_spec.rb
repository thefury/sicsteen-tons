require 'spec_helper'
require 'rails_helper'

describe SiteController do
  describe "GET client" do
    it "renders the /site/client template" do
      get :client
      expect(response).to render_template 'client'
    end
  end

  describe "GET operator" do
    it "renders the /site/operator template" do
      get :operator
      expect(response).to render_template 'operator'
    end
  end
end
