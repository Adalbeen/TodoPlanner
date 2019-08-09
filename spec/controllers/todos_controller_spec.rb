require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      response.successful?
    end
  end
end
