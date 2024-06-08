class SongsController < ApplicationController

  def search
    raise
    @songs = Song.where(title: params[:name])
    # @songs = Song.where(title: params[:query])
  end

  def index
    @songs = Song.all
  end

  def show
    raise
    @song = Song.find(params[:id])
  end

  def new #get
    @song = Song.new
  end

  def create #post
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  private
  def song_params
    params.require(:song).permit(:title, :year, :category)
  end
end
