get '/' do
  @all_topics = Topic.all
  erb :index
end

get '/guide/:guide_name' do
  @guide = Guide.find_by name: "#{params[:guide_name]}"
  #@votecount = ContributorGuides.votecount(@guide.id)
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
  @all_topics = Topic.all
  erb :index
end

post '/log_out' do
  session[:user_id] = nil
  redirect to('/')
end

post '/guide/query' do
  @guide =Guide.find_by(name: "#{params[:guide_query]}")
  if @guide
    erb :guides
  else
    @error = "We have no record of what you're looking for. "
    @all_topics = Topic.all
    erb :index
  end
end

get '/new_guide' do
  erb :new_guide
end

post '/new_guide/:new_post' do
  p params
  new_guide = params["new_guide"]

  new_topic = params["topic"]
  topic = Topic.find_by name: new_topic[:name]
  if topic
    Guide.create(name: new_guide["name"], explanation: new_guide["explanation"], topic: topic )
  else
    t = Topic.create(name: new_topic["name"])
    Guide.create(name: new_guide["name"], explanation: new_guide["explanation"], topic: t )
  end

  # listing = Guide.create(name: new_guide["name"], explanation: new_guide["explanation"])
  # ContributorGuides.create(contributor_id: session[:user_id], guide_id: listing.id )
  redirect to('/')
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up/' do
  person_data = params["sign_up"]
  new_contributor = Contributor.create(name: person_data[:name],email: person_data[:email],password: person_data[:password])
   # puts new_contributor.valid?
  if new_contributor.valid?
    session[:user_id] = new_contributor.id
    redirect to('/')
  else
    @error = "Didn't pass validation"
    if new_contributor.errors
      @error = new_contributor.errors.messages #"Email address invalid"
    end
    erb :sign_up
  end
end

post "/guides/dislike/" do
  erb :guides
end

post "/guides/like/" do
  erb :guides
end
