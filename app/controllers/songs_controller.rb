class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]
  
  def index
    #display from most recently added songs
   @songs = Song.all.order("created_at DESC")
  end
  
  def show
   
  end
  
  def new
   @song = Song.new
  end
  
  def create
   @song = Song.new(song_params)
   
   if @song.save
    redirect_to root_path
  else
    render 'new'
   end
   
  end
  
  def edit
    #code
  end
  
  def update
    if @song.update(song_params)
        redirect_to song_path(@song)
      else
        render 'edit'
    end
  end
    
  
  def destroy
    @song.destroy
    redirect_to root_path
  end
  
  private
    def song_params
      params.require(:song).permit(:title, :description, :artist)
    end
    
    def find_song
        @song = Song.find(params[:id])
    end
end
