class UsersController < ApplicationController
  before_action :require_login, :only => [:show]

  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to root_path flash[:errors] = ["Invalid username or password"] unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'show'
  end

  def show
    @groups = @user.groups if @user.groups
    
    #if user.group if invition.accepted? == yes, we display group
    #@user.groups.select {|group| group.accepted == true }

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
