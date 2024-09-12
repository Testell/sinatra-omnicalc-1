require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_form)
end

get("/square/new") do
  erb(:square_form)
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @square = @number**2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_form)
end

get("/square_root/results") do
  @number = params.fetch("number").to_f
  @square_root = Math.sqrt(@number)
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_form)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @random_number = rand(@min..@max)
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment_form)
end

get("/payment/results") do
  apr_input = params.fetch("apr").to_f  
  years = params.fetch("years").to_i  
  present_value = params.fetch("pv").to_f  

  @apr = apr_input / 100 / 12

  months = years * 12

  @numerator = @apr * present_value
  @denominator = 1 - (1 + @apr)**(-months)
  @monthly_payment = (@numerator / @denominator).to_fs(:currency)  

  @apr_display = apr_input.to_fs(:percentage, precision: 4)  
  @years = years  
  @principal_display = present_value.to_fs(:currency)  

  erb(:payment_results)
end
