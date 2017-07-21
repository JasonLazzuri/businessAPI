require 'rails_helper'

describe "gets a specific business", :type => :request do

  before do
    post '/businesses', params: {:name => 'Jason Inc.', :address => '101 Address Lane', :phone => '867-5309'}
  end

  it 'returns the businesses name' do
    expect(JSON.parse(response.body)['name']).to eq("Jason Inc.")
  end

  it 'returns the business address' do
    expect(JSON.parse(response.body)['address']).to eq('101 Address Lane')
  end

  it 'returns a created status' do
   expect(response).to have_http_status(:created)
 end

end
