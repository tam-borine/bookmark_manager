
class Bookmark < Sinatra::Base

  enable :sessions
  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  set :session_secret, 'super secret'
  enable :partial_underscores

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
