class Bookmark < Sinatra::Base

    get '/users/sign-in' do
      erb :'/users/sign-in'
    end

    post '/users/sign-in' do
      authenticated_user = User.authenticate_user(params[:email], params[:password])
      if authenticated_user
        session[:user_id] = authenticated_user.id
        redirect '/links'
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :'/users/sign-in'
      end
    end

    get '/users/new' do
      @user = User.new
      erb :'/users/new'
    end

    post '/users' do
      @user = User.new(username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect '/links'
      else
        @errors = @user.errors
        erb :'users/new'
      end
    end

    delete '/users/sign-out' do
      session.clear
      flash.keep[:notice] = "Goodbye"
      redirect '/links'
    end


end
