class UsersController <ApplicationController
 before_action :require_current_user!,except: [:create,:new]
  def new
    @users = User.all  
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
      redirect_to cats_url
    else
      render :new
    end
  end
  
  end

  def user_params
    params.require(:user).permit(:user_name,:password_digest,:session_token)
  end
end