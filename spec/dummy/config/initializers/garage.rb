Garage.configure {}
Garage.configuration.auth_filter = Garage::Doorkeeper::AuthFilter

Garage::TokenScope.configure do
  register :public do
    access :read, Post
  end

  register :read_private_post do
    access :read, PrivatePost
  end

  register :write_post do
    access :write, Post
  end

  register :read_post_body do
    access :read, PostBody
  end

  register :sudo, hidden: true do
    access :read, PrivatePost
    access :read, PostStream
  end

  register :meta do
    access :read, Garage::Meta::RemoteService
    access :read, Garage::Docs::Document
  end

  namespace :foobar do
    register :read_post do
      access :read, NamespacedPost
    end
  end
end

Doorkeeper.configure do
  orm :active_record

  resource_owner_authenticator do
    User.find_by_id(session[:user_id]) || redirect_to(new_session_url)
  end

  default_scopes(:public)
  optional_scopes(*Garage::TokenScope.optional_scopes)
end

ActiveSupport::Notifications.subscribe "garage.request" do |name, start, finish, id, payload|
  if payload[:token].application_id
    payload[:controller].response.headers['Application-Id'] = payload[:token].application_id
  end
end
