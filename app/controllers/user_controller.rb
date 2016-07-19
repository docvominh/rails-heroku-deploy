class UserController < ApplicationController
  # Define layout
  layout "home"

  # must login to access this controller
  before_action :require_login

  # under action will skip require_login
  skip_before_action :require_login, only: [:index, :insert_default]

  def index
    @user = UserModel.where(user_id: params[:user_id]).first
    if @user
      puts @user.user_id
    end
  end

  def create
    @user = UserModel.new
    @user_image = UserImage.new
  end

  def create_user
    @user = UserModel.new(user_params)

    if @user.invalid?
      render action: "create"
    end

    if @user.save
      redirect_to action: "index", user_id: @user.user_id
    end
  end

  def update
    @user = UserModel.where(user_id: params[:user_id]).first
    puts "************************ #{@user}"
  end

  def update_user
    @user = UserModel.new(user_params)

    puts @user
    # if @user.invalid?
    #   render action: "update"
    # end
    #
    # if User.update_attributes(@user)
    #   redirect_to action: "index", user_id: @user.user_id
    # end
  end

  def delete
    id = params[:id]
    if UserModel.delete(id)
      redirect_to action: "all"
    else

    end
  end

  def all
    @all_model = UserModel.all
  end

  def upload_user_image
    puts "1"
    @user_image = UserImage.new(image_params)
    puts "2"


    if @user_image.save
      render json: 'FUCK, cannot save to db'
    else
      render json: 'FUCK, cannot save to db'
    end
  end


  def insert_default
    @user = UserModel.new
    @user.user_id="minhpd"
    @user.password="123456"
    @user.user_name="Phạm Đức Minh"
    @user.email="phamducminh1990@gmail.com"
    if @user.save
      puts "save success"
    end

  end

  private
  def user_params
    params.required(:user_model).permit(:user_id, :user_name, :password, :password_confirmation, :date_of_birth, :email, :note, :img_url)
  end

  def image_params
    params.required(:user_image).permit(:name, :attachment)
  end


end
