require "swagger_helper"

RSpec.describe 'Mosques API', type: :request do
  let(:user) { User.create!(email_address: 'test@example.com', password: 'password') }

  let(:valid_attributes) do
    {
      name: 'Test Mosque',
      description: 'A mosque for testing purposes'
    }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  path '/mosques.json' do
    get 'List mosques' do
      tags 'Mosques'
      produces 'application/json'

      response '200', 'successful' do
        before { Mosque.create!(valid_attributes) }

        run_test! do
          expect(json.size).to be >= 1
        end
      end
    end

    post 'Create mosque' do
      before do
        sign_in_as(user)
      end

      tags 'Mosques'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :mosque, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: [ 'name' ]
      }

      response '201', 'mosque created' do
        let(:mosque) { valid_attributes }
        run_test!
      end

      response '422', 'invalid request' do
        let(:mosque) { invalid_attributes }
        run_test!
      end
    end
  end

  path '/mosques/{id}.json' do
    parameter name: :id, in: :path, type: :string, description: 'Mosque ID'

    get 'Show mosque' do
      tags 'Mosques'
      produces 'application/json'

      response '200', 'found' do
        let(:id) { Mosque.create!(valid_attributes).id }
        run_test!
      end

      response '404', 'not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    patch 'Update mosque' do
      before do
        sign_in_as(user)
      end

      tags 'Mosques'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :mosque, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        }
      }

      response '200', 'mosque updated' do
        let(:id) { Mosque.create!(valid_attributes).id }
        let(:mosque) { { name: 'Updated Mosque Name', description: 'Updated description' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { Mosque.create!(valid_attributes).id }
        let(:mosque) { invalid_attributes }
        run_test!
      end
    end

    delete 'Delete mosque' do
      before do
        sign_in_as(user)
      end

      tags 'Mosques'
      produces 'application/json'

      response '204', 'mosque deleted' do
        let(:id) { Mosque.create!(valid_attributes).id }
        run_test!
      end
    end
  end
end
