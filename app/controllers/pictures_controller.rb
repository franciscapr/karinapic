# app/controllers/pictures_controller.rb
class PicturesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
      @pictures = Picture.all
    end
    
    def edit
        @picture = Picture.find(params[:id])
      end

    def show
      @picture = Picture.find(params[:id])
    end
  
    def new
      @picture = Picture.new
    end
  
    def create
      @picture = Picture.new(picture_params)
      @picture.user = current_user
  
      if @picture.save
        @picture.image.attach(params[:picture][:image]) if params[:picture][:image].present?
        redirect_to @picture, notice: "Imagen subida con éxito."
      else
        render :new
      end
    end
  
    private
  
    def picture_params
      params.require(:picture).permit(:name, :description, :image)
    end
  end
  