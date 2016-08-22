require 'jsonapi/authorization/default_pundit_authorizer'

module JSONAPI
  module Authorization
    class Configuration
      attr_accessor :authorizer
      attr_accessor :pundit_user

      def initialize
        self.authorizer  = ::JSONAPI::Authorization::DefaultPunditAuthorizer
        self.pundit_user = :user
      end
    end

    class << self
      attr_accessor :configuration
    end

    @configuration ||= Configuration.new

    def self.configure
      yield(@configuration)
    end
  end
end
