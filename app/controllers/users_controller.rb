class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]

  def new
    @user = User.new
  end

  def index
    @users = User.includes(:profile_picture_attachment).all
  end

  def create
    @user = User.new(user_params)
    @user.profile_picture.attach(params[:user][:profile_picture])
    if @user.save
      redirect_to root_path, notice: "Usuario registrado exitosamente."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to edit_user_registration_path, notice: "Perfil actualizado exitosamente."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile_picture)
  end
end
