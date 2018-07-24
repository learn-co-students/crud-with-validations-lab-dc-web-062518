class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(title: params[:song][:title], released: params[:song][:released], release_year: params[:song][:release_year], artist_name: params[:song][:artist_name], genre: params[:song][:genre])
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
    if @song.valid?
    redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def show
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path, :notice => "Your patient has been deleted"
  end

end
