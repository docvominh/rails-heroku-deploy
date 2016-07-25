class UserController < ApplicationController
  # Define layout
  layout "home"

  # must login to access this controller
  before_action :require_login

  # under action will skip require_login
  skip_before_action :require_login, only: [:index, :insert_default]

  skip_before_action :verify_authenticity_token, only: [:upload_user_image]

  respond_to :html, :xml, :json

  def index
    @user = UserModel.where(user_id: params[:user_id]).first
    if @user
      puts @user.user_id
    end
  end

  def create
    @user = UserModel.new
  end


  def create_user
    @user = UserModel.new(user_params)

    if @user.invalid?
      render action: "create"
    end

    if @user.save
      if request.xhr?
        render :json => {
            :user => @user,
        }
      else
        redirect_to action: "index", user_id: @user.user_id
      end
    end
  end


  def create_ajax_form
    @user = UserModel.new
  end

  def create_user_rails_ajax_form
    @user = UserModel.new(user_params)

    if @user.invalid?
      render action: 'create_ajax_form'
    end

    if @user.save
      if request.xhr?
        respond_to do |format|
          # format.html { render 'create_ajax_form_template' }
          format.js { render '_create_ajax_form_action' }
          # format.json { render :json => {
          #     :user => @user
          # } }
        end
      else
        redirect_to action: "index", user_id: @user.user_id
      end
    end
  end


  def update
    @user = UserModel.where(user_id: params[:user_id]).first
  end

  def update_user

    user = UserModel.find_by_id(user_params[:id])
    if user.invalid?
      render action: "update"
    end


    current_user = UserModel.new(user_params)

    user.assign_attributes({:user_id => current_user.user_id,
                            :user_name => current_user.user_name,
                            :date_of_birth => current_user.date_of_birth,
                            :email => current_user.email,
                            :img_url => current_user.img_url,
                            :note => current_user.note})
    if user.save
      redirect_to action: "index", user_id: user.user_id
    end
  end

  def delete
    id = params[:id]
    if UserModel.delete(id)
      redirect_to action: "all"
    else

    end
  end

  def all

    puts "FUCKKKKKKKKKKKKKK 2"
    @all_model = UserModel.all.order(:id)
    @search_user_model = SearchUserModel.new("", "")
  end

  def search_user
    search_condition = search_params
    # CUSTOM QUERY
    all_model = UserModel.all.order(:id)
    all_model = all_model.where('user_id ILIKE ?', "%#{search_condition['user_id']}%").order(:id) unless !params[:user_id].blank?
    all_model = all_model.where('user_name ILIKE ?', "%#{search_condition['user_name']}%").order(:id) unless !params[:user_name].blank?

    if request.xhr?
      @all_model = all_model
      puts "AJAXXXXXXXXXXXXXX"
      respond_to do |format|
        # format.html { render 'all_list_template' }
        format.js { render '_all_list_action' }

        # if you want to get json only in basic ajax
        # format.json { render :json => {
        #     :all_model => all_model
        # } }

      end
    else
      # AND QUERY
      # @all_model = UserModel.where(:user_id => search_condition['user_id'], :user_name => search_condition['user_name'])

      @all_model = all_model
      @search_user_model = SearchUserModel.new(search_condition['user_id'], search_condition['user_name'])
      render 'all'
    end
  end

  def upload_user_image
    user_image = UserImage.new(image_params)

    if user_image.save
      @id = user_image.id

      render :json => {
          :id => @id,
      }
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
    params.require(:user_model).permit(:id, :user_id, :user_name, :password, :password_confirmation, :date_of_birth, :email, :note, :img_url)
  end

  def image_params
    params.require(:user_image).permit(:name, :attachment)
  end

  def search_params
    params.require(:search_user_model).permit(:user_id, :user_name)
  end


end
