require "sinatra"

configure do
  enable :sessions
  set :session_secret, "secret"
end

def empty_item(hash)
  missing = hash.select {|k, v| v == nil }
  
  return missing
end

get "/" do
  erb :home
end

get "/payments" do
  erb :payments
end

post "/payments/create" do
  first_name = params[:first_name]
  
  redirect "/payments"
end



=begin
post "/payments/create" do
  first_name = params[:first_name]
  last_name = params[:last_name]
  card_number = params[:card_number]
  date = params[:date]
  ccv = params[:ccv]
  
  payment = { :first_name => first_name,
              :last_name => last_name,
              :card_number => card_number,
              :date => date,
              :ccv => ccv
            }
  if empty_item(payment).size > 0
    session[:error] = "Sorry, you must enter values for #{empty_item(hash).keys.join(", ")}."
    redirect "/payments"
  end
  
end
=end