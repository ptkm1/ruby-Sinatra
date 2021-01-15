require 'sinatra'
require 'json'

set :public_folder, '/public'

get '/' do
  send_file './public/index.html' # sending file containning html view
end

# TESTING ROUTE WITH PARAMETERS/QUERYS HTTP

get '/paramstest/:nome' do |n|
  "Hello #{n}" # getting this parameter passed in the query/param of HTTPs route
end

# TESTING ROUTE POST

post '/usuario' do

  obj = params
  # Params get the body of requisition |
  # for store one object in the variable to send at response body, is necessary pass ['name of field']

  { object: obj }.to_json
end

post '/login' do

  obj =
  {
    email: params['email'],
    password: params['password']
  }

  if params['email'] != ""
    
    if params['password'] != ""
      { object: obj }.to_json
    end

  else
    { message: 'Not authenticated'  }.to_json
  end

end