module Garage
  module Doorkeeper
    # doorkeeper_token has same interface with Garage::Strategy::AccessToken
    module Strategy
      extend ActiveSupport::Concern

      # Garage::ControllerHelper already implements `doorkeeper_token`,
      # so monkey patch here.
      ::Doorkeeper::Helpers::Filter.class_eval do
        alias_method :original_doorkeeper_token, :doorkeeper_token
      end

      included do
        include ::Doorkeeper::Helpers::Filter
        alias_method :doorkeeper_unauthorized_render_options, :unauthorized_render_options
        doorkeeper_for :all
      end

      def verify_permission?
        true
      end

      def access_token
        original_doorkeeper_token
      end
    end
  end
end
