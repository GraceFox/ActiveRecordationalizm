get '/' do
  erb :index
end

get '/:guide_name' do
  @guide = Guide.find_by name: "#{params[:guide_name]}"
  erb :guides
end

post '/log_in' do
end

