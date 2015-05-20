module Garage
  module Strategy
    # doorkeeper_token has same interface with Garage::Strategy::AccessToken
    module Doorkeeper
      extend ActiveSupport::Concern

      included do
        before_action :doorkeeper_authorize!
        alias_method :doorkeeper_unauthorized_render_options, :unauthorized_render_options
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
