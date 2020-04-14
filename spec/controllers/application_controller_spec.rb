require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  let!(:user) { create(:user) }
  let(:headers) { { 'Authorization' => JsonWebToken.encode(user_id: user.id) } }
  let(:invalid_headers) { { 'Authorization' => nil } }

  describe "#authenticate_request" do
    context "when auth token is present" do
      before do 
        allow(request).to receive(:headers).and_return(headers)
      end

      it "sets the current user" do
        expect(subject.instance_eval { authenticate_request }).to eq(user)
      end
    end

    context "when auth token is not present" do
      before do
        allow(request).to receive(:headers).and_return(invalid_headers)
      end

      it "raises an error" do
        expect { subject.instance_eval { authenticate_request } }.to raise_error(StandardError, /Missing token/)
      end
    end
  end
end
