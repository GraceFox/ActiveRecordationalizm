get '/' do
  erb :index
end

get '/:guide_name' do
  @guide = Guide.find_by name: "#{params[:guide_name]}"
  erb :guides
end

post '/log_in' do
  user = params["log_in"]
  @contributor = Contributor.find_by_name(user["user_name"])
  if @contributor == nil
    @error = "Your user name isn't recognised here. Also, you're a special snowflake and I love you for what you are"
    @error.inspect
  elsif @contributor.is_password_valid(user["password"])
      session[:user_id] = @contributor.id
  else
      @error = "Your password is wrong. You can do better"
      @error.inspect
  end
  redirect to('/')
end


post '/log_out' do
  session[:user_id] = nil
  redirect to('/')
end

post '/query' do
  @guide =Guide.find_by name: "#{params[:guide_query]}"
  erb :guides
end
