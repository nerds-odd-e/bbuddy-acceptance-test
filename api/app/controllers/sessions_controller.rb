module DeviseTokenAuth
  class SessionsController < DeviseTokenAuth::ApplicationController
    skip_before_action :authenticated_only
  end
end