class Diagramarama < Sinatra::Application
  get "/" do
    diagrams = Diagram.all
      haml :index, locals: { diagrams: diagrams }
  end

end
