class Diagramarama < Sinatra::Application

  get "/diagram" do
    respond_to do |wants|
      wants.html { haml :diagram, locals: { diagram: nil } }
    end
  end

  get "/diagram/:id" do
    d = Diagram[params[:id]]
    respond_to do |wants|
      wants.js { d.to_json }
      wants.json { d.to_json }
      wants.html { haml :diagram, locals: { diagram: d } }
    end
  end

  post "/diagram" do
    content_type :json
    d = Diagram.new.merge_params(params).save
    respond_to do |wants|
      wants.js { d.to_json }
      wants.json { d.to_json }
      wants.html { d.to_json }
    end
  end

  put "/diagram/:id" do
    content_type :json
    d = Diagram[params[:id]].merge_params(params).save
    respond_to do |wants|
      wants.js { d.to_json }
      wants.json { d.to_json }
      wants.html { d.to_json }
    end
  end

  delete "/diagram/:id" do
    Diagram[params[:id]].destroy
    respond_to do |wants|
      wants.js { 200 }
      wants.json { 200 }
      wants.html { 200 }
    end
  end
end
