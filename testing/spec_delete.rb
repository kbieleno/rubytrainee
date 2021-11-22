require_relative 'spec_helper'

RSpec.describe 'DELETE' do

  app_cl = ApiClient.new

  context 'verify user with valid ID' do

    before(:each) { @id = IdGenerator.valid_id }
  
    it 'can be deleted and correct code received' do
      response = app_cl.delete_user(@id)
      expect(response.status).to eq(333)
    end

    it 'can be deleted in DB' do
      app_cl.delete_user(@id)
      response = app_cl.get_user(@id)
      expect(response.status).to eq(443)
    end

    it 'cannot be deleted twice' do
      app_cl.delete_user(@id)
      response = app_cl.delete_user(@id)
      expect(response.status).to eq(443)
    end
  end
  
end