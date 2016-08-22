require 'spec_helper'

RSpec.describe JSONAPI::Authorization::DefaultPunditAuthorizer do
  after{
    # Set this back to the default after each
    JSONAPI::Authorization.configuration.pundit_user = :user
  }

  describe '.user_context' do
    context "given a symbol" do
      it "returns the 'user'" do
        user = User.new
        jsonapi_context = { current_user: user }
        JSONAPI::Authorization.configuration.pundit_user = :current_user
        expect(JSONAPI::Authorization.user_context(jsonapi_context)).to be user
      end
    end

    context "given a proc" do
      it "returns the 'user'" do
        user = User.new
        jsonapi_context = { current_user: user }
        JSONAPI::Authorization.configuration.pundit_user = ->(context){ context[:current_user] }
        expect(JSONAPI::Authorization.user_context(jsonapi_context)).to be user
      end
    end
  end
end
