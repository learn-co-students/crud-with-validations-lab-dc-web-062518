class SongsController < ApplicationController

  before_action :set_song, only: [:edit, :update, :show, :destroy]

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def index
    @songs = Song.all
  end

  def update
    @song.update(song_params)
      if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

end
