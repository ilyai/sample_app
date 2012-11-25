class SessionsController < ApplicationController

  def new
    @title = "Sign In"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid credentials"
      @title = "Sign In"
      render :new
    else
      # Handle successful signin.
    end
  end

  def destroy

  end

end
