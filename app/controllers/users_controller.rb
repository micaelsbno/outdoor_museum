class UsersController < ApplicationController
  
  def new
    @pictures = Picture.all
    @picture = Picture.all.pluck('img_url').sample
  end 

  def create
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      render :new
    end
  end
end

