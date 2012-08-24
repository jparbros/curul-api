class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Cookies
  include ActionController::HttpAuthentication::Token
  include ActionController::HttpAuthentication::Token::ControllerMethods

  require 'searches/initiatives'

  before_filter :restrict_access

  def restrict_access
    api_key = Application.find_by_access_token(params[:access_token])
    unless api_key
      head :unauthorized
    else
      Application.current = self.current_app = api_key
    end
  end

  def current_app=(app)
    @current_app ||=app
  end

  def current_app
    @current_app
  end

end
