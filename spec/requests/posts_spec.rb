require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) do
      get '/users/10/posts'
    end

    it 'GET requests response status was correct' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    describe 'GET #show' do
      before(:each) do
        get '/users/1/posts/1'
      end

      it 'GET requests response status was correct' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders a correct template' do
        expect(response).to render_template(:show)
      end
    end
  end
end
