module Garage
  module Doorkeeper
    module Strategy
      extend ActiveSupport::Concern

      included do
        include ::Doorkeeper::Helpers::Filter
        # doorkeeper_token has same interface with Garage::Strategy::AccessToken
        alias_method :access_token, :doorkeeper_token
        alias_method :doorkeeper_unauthorized_render_options, :unauthorized_render_options

        doorkeeper_for :all
      end

      def verify_permission?
        true
      end
    end
  end
end
