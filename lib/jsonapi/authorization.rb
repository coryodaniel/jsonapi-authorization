require "jsonapi-resources"
require "jsonapi/authorization/authorizing_processor"
require "jsonapi/authorization/configuration"
require "jsonapi/authorization/default_pundit_authorizer"
require "jsonapi/authorization/pundit_scoped_resource"
require "jsonapi/authorization/version"

module JSONAPI
  module Authorization
    def user_context(context)
      if JSONAPI::Authorization.configuration.pundit_user.is_a?(Symbol)
        context[JSONAPI::Authorization.configuration.pundit_user]
      else
        JSONAPI::Authorization.configuration.pundit_user.call(context)
      end
    end
    module_function :user_context
    # Your code goes here...
  end
end

# Allows JSONAPI configuration of operations_processor using the symbol :jsonapi_authorization
JsonapiAuthorizationProcessor = JSONAPI::Authorization::AuthorizingProcessor
