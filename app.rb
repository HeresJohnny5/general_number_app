require 'sinatra'
require_relative 'functions.rb'
require 'sinatra/reloader' if development?

enable :sessions

get '/' do 
	erb :get_name
end

post '/name' do
	session[:user_name] = params[:user_name] 
	redirect '/age?user_name=' + session[:user_name] 
end

get '/age' do
	erb :get_age, :locals => { :user_name => session[:user_name] }
end

post '/age' do
	session[:user_age] = params[:user_age] 
	redirect '/numbers?user_age=#{session[:user_age]}&user_name=#{session[:user_name]}'
end

get '/numbers' do
	erb :numbers, :locals => { :user_age => session[:user_age], :user_name => session[:user_name] }
end

post '/numbers' do
	session[:user_name] = params[:user_name]
	session[:user_age] = params[:user_age].to_i
	session[:fav_num1] = params[:fav_num1].to_i
	session[:fav_num2] = params[:fav_num2].to_i
	session[:fav_num3] = params[:fav_num3].to_i

	sum = sum(session[:fav_num1], session[:fav_num2], session[:fav_num3])

	age_num_conditional(session[:user_name], session[:user_age], session[:fav_num1], session[:fav_num2], session[:fav_num3], sum)	
end