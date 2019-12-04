class ApplicationController < ActionController::Base
  protected
  def after_sign_in_path_for(resource)
    root_path
  end
end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
end