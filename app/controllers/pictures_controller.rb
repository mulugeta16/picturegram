class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :user_login_check
  def index
    @pictures = Picture.all
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def new

      @picture = Picture.new
  end

   def edit
       if @picture.user != current_user
         flash.now[:error] = 'unauthorized access!'
         redirect_to pictures_path
       else
     end
   end

   def create
   @picture = Picture.new(picture_params)
   @picture.user_id = current_user.id
          if @picture.save
      PictureMailer.picture_mail(@picture).deliver
    redirect_to pictures_path, notice: 'Picture was posted'
    else
    render :new
  end
 end
end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end
  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html {redirect_to pictures_url, notice: 'Picture was deleted'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def picture_params
      params.require(:picture).permit(:image, :content, :image_cache, :user_id, :email)
    end

    def user_login_check
   unless logged_in?
     redirect_to new_session_path
   end
 end
