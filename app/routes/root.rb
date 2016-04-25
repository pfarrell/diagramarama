class Diagramarama < Sinatra::Application
  get "/" do
    diagrams = Diagram.all
    respond_to do |wants|
      wants.html { haml :index, locals: { diagrams: diagrams } }
    end
  end

end
