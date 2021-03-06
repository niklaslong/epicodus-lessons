class PhotosController < ApplicationController
  def index
    if params['filter'] === "user_images"
      @photos = Photo.user_images(current_user)
    else
      @photos = Photo.all
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @tag = Tag.new
    @tagged_users = User.find_tagged_users(@photo.id)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo successfully added!"
      redirect_to  photos_path
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    render :edit
  end

  def update
    @photo= Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    flash[:alert] = "Photo has been deleted"
    @photo.destroy
    redirect_to photos_path
  end

private
  def photo_params
    params.require(:photo).permit(:image, :description)
  end
end
