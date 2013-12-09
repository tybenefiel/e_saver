class UsersController < ApplicationController
  before_action(:find_user, :only => [:show, :edit, :update, :destroy])



  def find_user
    @user = User.find_by(id: params[:id])
  end



  def index
      @users = User.all
    end


  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]



      if @user.save
        redirect_to users_url, notice: "User created successfully."
      else
        render 'new'
      end

  end

  def edit
    find_user
  end

  def update
    find_user
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]

    if @user.save
      redirect_to users_url, notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    find_user
    @user.destroy

    redirect_to users_url, notice: "User deleted."
  end
end
