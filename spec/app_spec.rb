require 'spec_helper'

describe 'Diagramarama' do
  it "should allow access to the home page" do
    get "/"
    expect(last_response).to be_ok
  end

  it "has a create diagram page" do
    get "/diagram"
    expect(last_response).to be_ok
  end

end
