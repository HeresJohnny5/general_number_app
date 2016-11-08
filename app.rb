require "sinatra"
require_relative "functions.rb"
require "sinatra/reloader" if development?

get "/" do 
	erb :get_name
end

post "/name" do
	name = params[:user_name] 
	redirect "/age?users_name=" + name 
end

get "/age" do
	name = params[:users_name]
	erb :get_age, :locals => { :your_name => name }
end

post "/age" do
	age = params[:user_age]
	name = params[:user_name]
	redirect "/numbers?user_age=#{age}&user_name=#{name}"
end

get "/numbers" do
	age = params[:user_age]
	name = params[:user_name]
	erb :numbers, :locals => { :your_age => age, :your_name => name }
end

post "/numbers" do
	name = params[:user_name]
	age = params[:user_age].to_i
	fav_num1 = params[:fav_num1].to_i
	fav_num2 = params[:fav_num2].to_i
	fav_num3 = params[:fav_num3].to_i

	sum = sum(fav_num1, fav_num2, fav_num3)

	age_num_conditional(age, sum, name, fav_num1, fav_num2, fav_num3)
	
end