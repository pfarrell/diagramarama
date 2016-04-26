require 'spec_helper'

describe Diagram do

  let(:diagram) { Diagram.new(title: 'test diagram', text: 'test').save }

  it 'retrieves diagrams' do
    get "/diagram/#{diagram.id}"
    expect(last_response).to be_ok
  end

  it 'retrieves diagrams' do
    get "/diagram/#{diagram.id}.json"
    expect(last_response).to be_ok
    expect(last_response.header['Content-Type']).to include 'application/json'
  end

  it 'creates diagrams' do
    post "/diagram", {title: "test diagram", text: "title: test diagram\ntest"}
    expect(last_response.header['Content-Type']).to include 'application/json'
    id=JSON.parse(last_response.body)['id']
    ret = Diagram[id.to_i]
    expect(ret.title).to eq "test diagram"
    expect(ret.text).to eq "title: test diagram\ntest"
  end

  it 'updates diagrams' do
    put "/diagram/#{diagram.id}", {title: "updated diagram", text: "updated text"}
    expect(last_response.header['Content-Type']).to include 'application/json'
    id=JSON.parse(last_response.body)['id']
    ret = Diagram[id.to_i]
    expect(ret.title).to eq "updated diagram"
    expect(ret.text).to eq "updated text"
  end

  it 'deletes diagrams' do
    id = diagram.id
    delete "/diagram/#{id}"
    expect(last_response.status).to eq 200
    ret = Diagram[id]
    expect(ret).to be_nil
  end


end
