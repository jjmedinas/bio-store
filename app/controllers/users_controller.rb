class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :block, :unblock]
  before_action :authenticate_user!

  # GET /users
  def index
    role = params[:role] || User::ROLES
    state = params[:state] || User::STATES
    @users = User.where(role: role, state: state)

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def block
    @user.block!
    render json: {message: 'ok'}, status: 200
  end

  def unblock
    @user.unblock!
    render json: {message: 'ok'}, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by id: params[:id]
      render json: {error: 'user not found'}, status: 404 if @user.nil?
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation, :role, :state, :address)
    end
end
