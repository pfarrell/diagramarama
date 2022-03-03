class Diagramarama < Sinatra::Application

  def extract_title(text)
    title = "untitled"
    line = text.split("\n")[0]
    if(line =~ /^title/)
      title = line.gsub(/^title:[ ]*/, "")
    end
    title
  end

  get "/diagram" do
    haml :diagram, locals: { diagram: nil }
  end

  get "/diagram/:id" do
    d = Diagram[params[:id]]
    haml :diagram, locals: { diagram: d }
  end

  post "/diagram" do
    content_type :json
    d = Diagram.new.merge_params(params)
    d.title = extract_title(params[:text])
    d.save
    d.to_json
  end

  put "/diagram/:id" do
    content_type :json
    d = Diagram[params[:id]].merge_params(params).save
    d.to_json
  end

  delete "/diagram/:id" do
    Diagram[params[:id]].destroy
    200
  end
end
