require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :controller do
  describe 'POST #create' do
    it 'creates a new contact' do
      expect {
        post :create, params: { contact: { first_name: "aswin", last_name: "sounder", email: "aswin@gmail.com" , address: "No 10, chennai, TN, India", phone_number: "9784698724"} }, as: :json 
      }.to change(Contact, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it 'returns unprocessable_entity response for invalid input' do
      post :create, params: { contact: { first_name: "", last_name: "sounder", email: "aswin@gmail.com" , address: "No 10, chennai, TN, India", phone_number: "9784698724"} }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'creation of new contact should increase the delayed job count' do
      expect {
        post :create, params: { contact: { first_name: "aswin", last_name: "sounder", email: "aswin@gmail.com" , address: "No 10, chennai, TN, India", phone_number: "9784698724"} }, as: :json 
      }.to change(Delayed::Job, :count).by(1)
      expect(response).to have_http_status(:created)
    end

  end

  describe 'PUT #update' do
    before(:each) do
      @contact = FactoryGirl.create(:contact)  
    end

    it 'updates an existing contact' do
      put :update, params: { id: @contact.id, contact: { first_name: "aswin", last_name: "sounder", email: "aswinsounder@gmail.com" , address: "No 10, chennai, TN, India", phone_number: "9784698724"} }, as: :json 
      expect(response).to have_http_status(:ok)
      expect(@contact.reload.email).to eq('aswinsounder@gmail.com')
    end

    it 'returns unprocessable_entity response for invalid input' do
      put :update, params: { id: @contact.id, contact: { first_name: "" } }, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
    end
    
    it 'should increase the delayed job count when record got updated' do
      expect {
        put :update, params: { id: @contact.id, contact: { first_name: "aswin", last_name: "kumar", email: "aswin@gmail.com" , address: "No 10, chennai, TN, India", phone_number: "9784698724"} }, as: :json 
      }.to change(Delayed::Job, :count).by(1)
      expect(response).to have_http_status(:ok)
    end
  end
end
