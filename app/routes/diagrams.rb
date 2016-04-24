class Diagramarama < Sinatra::Application
  get "/diagram/:id" do
    content_type :json
    d = Diagram[params[:id]]
    respond_to do |wants|
      wants.js { d.to_json }
      wants.json { d.to_json }
      wants.html { d.to_json }
    end
  end

  post "/diagram" do
    d = Diagram.new.merger_params(params)
    respond_to do |wants|
      wants.js { d.to_json }
    end
  end

  put "/diagram/:id" do
    d = Diagram[params[:id]].merge_params(params).save
    respond_to do |wants|
      wants.js { d.to_json }
    end
  end

  delete "/diagram/:id" do
    Diagram[params[:id]].destroy
    respond_to do |wants|
      wants.js { 200 }
    end
  end
end
