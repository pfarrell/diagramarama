require 'spec_helper'

describe Diagram do

  let(:diagram) { Diagram.new(title: 'test diagram').save }

  it 'retrieves diagrams' do
    get "/diagram/#{diagram.id}"
    expect(last_response.header['Content-Type']).to include 'application/json'
  end

end
