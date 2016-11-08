def age_num_conditional(name, age, fav_num1, fav_num2, fav_num3, sum)
	if age > sum
		"Hey #{session[:name]} your age of #{session[:age]} is greater than #{sum}, which is the sum of your 3 favorite numbers, #{fav_num1}, #{fav_num2}, #{fav_num3}."
	else
		"Hey #{session[:name]} your age of #{session[:age]} is less than #{sum}, which is the sum of your 3 favorite numbers, #{fav_num1}, #{fav_num2}, #{fav_num3}."
	end
end

def sum(*numbers)
	total = 0
	numbers.each do |number|
		total += number
	end
	total
end