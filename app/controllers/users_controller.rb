class UsersController < Clearance::UsersController
  before_action :require_login, only: :show
  before_action :set_user, only: %i[show update edit]

  def index
    @user = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :avatar, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end