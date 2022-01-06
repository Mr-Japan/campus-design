class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
    render 'index'
  end
  
end
