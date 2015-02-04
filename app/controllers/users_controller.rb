class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  # find which user was called via the web address
                                    # blah.com/users/<1>
  end

  def new
    @user = User.new                # create a new user object to pass to the form_for
                                    # helper which builds the form based on
                                    # a user's attributes
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)   # redirect_to is a rails method that redirects the browser
                                    # to the passed url, user_url(@user)
                                    # generates the html path to the user's show action
      flash[:success] = "Welcome to the Sample App!"
    else
      render 'new'                  # reloads the new page
    end
  end

  private
#------------------------------------------------------------------------------ 
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
