class PhotosController < ApplicationController
  before_action :current_user_must_be_photo_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_photo_user
    photo = Photo.find(params[:id])

    unless current_user == photo.poster
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Photo.ransack(params[:q])
    @photos = @q.result(:distinct => true).includes(:poster, :comments, :likes).page(params[:page]).per(10)

    render("photos/index.html.erb")
  end

  def show
    @like = Like.new
    @comment = Comment.new
    @photo = Photo.find(params[:id])

    render("photos/show.html.erb")
  end

  def new
    @photo = Photo.new

    render("photos/new.html.erb")
  end

  def create
    @photo = Photo.new

    @photo.name_photo = params[:name_photo]
    @photo.caption_photo = params[:caption_photo]
    @photo.image = params[:image]
    @photo.poster_id = params[:poster_id]

    save_status = @photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/photos/new", "/create_photo"
        redirect_to("/photos")
      else
        redirect_back(:fallback_location => "/", :notice => "Photo created successfully.")
      end
    else
      render("photos/new.html.erb")
    end
  end

  def edit
    @photo = Photo.find(params[:id])

    render("photos/edit.html.erb")
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.name_photo = params[:name_photo]
    @photo.caption_photo = params[:caption_photo]
    @photo.image = params[:image]
    @photo.poster_id = params[:poster_id]

    save_status = @photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/photos/#{@photo.id}/edit", "/update_photo"
        redirect_to("/photos/#{@photo.id}", :notice => "Photo updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Photo updated successfully.")
      end
    else
      render("photos/edit.html.erb")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    if URI(request.referer).path == "/photos/#{@photo.id}"
      redirect_to("/", :notice => "Photo deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Photo deleted.")
    end
  end
end
