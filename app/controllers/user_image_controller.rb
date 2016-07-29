class UserImageController < ApplicationController
  # Define layout
  layout "home"

  def index
    @all_image = UserImage.all
  end

  def new
    @user_image = UserImage.new()
  end

  def create
    user_image = UserImage.new(image_params)
    if user_image.save
      redirect_to action: 'index'
    end
  end

  def destroy
    id = params[:id]
    if UserImage.delete(id)
      redirect_to action: 'index'
    else

    end
  end

  def image_autocomplete



    @all_image = UserImage.where('name ILIKE ?', "%#{params["term"]}%").order(:name)
    puts "STARTTTTTTTTTTTTTTTTTTTTTT"
    # @all_image.each do |item|
    #   item.image_url = item.attachment_url
    #   puts item.image_url
    # end

    # if you want to get json only in basic ajax
    respond_to do |format|
      format.json { render :json => {
          :all_image => @all_image
      } }
    end
  end

  private
  def image_params
    params.require(:user_image).permit(:name, :attachment)
  end

  # def image_autocomplete_params
  #   params.require(:input).permit(:term)
  # end
end


