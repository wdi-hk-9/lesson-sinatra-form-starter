class SongsApp < Sinatra::Base

  # root route
  get "/" do
    redirect('/songs')
  end

  # about page
  get "/about" do
    erb(:about)
  end

  # index
  get '/songs' do
    @songs = Song.all
    erb(:"songs/index")
  end

  # new
  get '/songs/new' do
    erb(:"songs/new")
  end

  # create
  post '/songs' do
    @song = Song.new(params[:song])
    if @song.save
      redirect("/songs/#{@song.id}")
    else
      erb(:"songs/new")
    end
  end

  # show
  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb(:"songs/show")
  end

  # edit
  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb(:"songs/edit")
  end

  # update
  post '/songs/:id/update' do
    @song = Song.find(params[:id])
    if @song.update(params[:song])
      redirect("/songs")
    else
      erb(:"songs/edit")
    end
  end

  # destroy
  post '/songs/:id/delete' do
    @song = Song.find(params[:id])
    if @song.destroy
      redirect('/songs')
    else
      redirect("/songs/#{@song.id}")
    end
  end

end
