class UsersController < ApplicationController

	def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = current_user
    render 'show.html.erb'
  end

  def update
    @user = current_user
    @user.about = params[:about]
    @user.photo = params[:photo]
    @user.blog_url = params[:blog_url]
    @user.website = params[:website]
    if @user.save
      flash[:success] = "profile updated"
      redirect_to "/profile"
    end

  end


end
