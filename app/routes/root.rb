class Diagramarama < Sinatra::Application
  get "/" do
    respond_to do |wants|
      wants.html { haml :index }
    end
  end
end
