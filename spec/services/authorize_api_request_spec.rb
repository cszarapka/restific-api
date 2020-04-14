require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => JsonWebToken.encode(user_id: user.id) } }
  subject(:invalid_request_obj) { described_class.new({}) }
  subject(:request_obj) { described_class.new(header) }

  describe '#call' do
    context 'when valid request' do
      it 'returns user object' do
        result = request_obj.call
        expect(result).to eq(user)
      end
    end

    context 'when invalid request' do
      context 'when missing token' do
        it 'raises an error' do
          expect { invalid_request_obj.call }.to raise_error(StandardError, /Missing token/)
        end
      end

      context 'when malformed header' do
        subject(:invalid_request_obj) do
          described_class.new('Authorization' => 'not-a-token')
        end

        it 'raises an error' do
          expect { invalid_request_obj.call }.to raise_error(StandardError, /Not enough or too many segments/)
        end
      end

      context 'when token is expired' do
        let(:header) { { 'Authorization' => JsonWebToken.encode({ user_id: user.id }, (Time.now.to_i - 10)) } }
        subject(:request_obj) { described_class.new(header) }

        it 'raises an error' do
          expect { request_obj.call }.to raise_error(StandardError, /Signature has expired/)
        end
      end
    end
  end
end
