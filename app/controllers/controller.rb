get '/' do
  erb :index
end

get '/guide/:guide_name' do
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
  erb :index
end

post '/log_out' do
  session[:user_id] = nil
  redirect to('/')
end

post '/guide/query' do
  @guide =Guide.find_by name: "#{params[:guide_query]}"
  erb :guides
end

get '/new_guide' do
  erb :new_guide
end

post '/new_guide/:new_post' do
  new_guide = params["new_guide"]
  Guide.create(name: new_guide["name"], description: new_guide["description"])
  redirect to('/')
end

get '/error' do
  erb :index
end