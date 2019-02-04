class CalcController < ApplicationController
  
  def flex_square
    # The parameters look like this :{"number"=>"42"}
    #Rails put that hash in a variable called params
    
    @num = params.fetch("number")
    @square_num = @num.to_i**2
    
    render("calc_templates/flexible_square.html.erb")
  end
   
  def flex_square_root
    # The parameters look like this :{"number"=>"42"}
    #Rails put that hash in a variable called params
    
    @num = params.fetch("number")
    @square_root = Math.sqrt(@num.to_i)
    
    render("calc_templates/flexible_square_root.html.erb")
  end
  
  def flex_payment

    @years = params.fetch("periods").to_i
    @principal = params.fetch("amount").to_i
    @rate = params.fetch("rate").to_f/100
    @monthly_payment = (@rate/100/12*@principal)/(1-(1+@rate/100/12)**(-@years*12))
  
    render("calc_templates/flexible_payment.html.erb")
  end
  
  def flex_random
    @min = params.fetch("min").to_i
    @max = params.fetch("max").to_i
    @rand_num = rand(@min..@max)
    
    render("calc_templates/flexible_random_number.html.erb")
  end
 
  def blank_square_form
    
    render ("calc_templates/square_form.html.erb")
    
  end
  
  def square_form_results
    
    @input_number = params.fetch("user_number").to_f
    @squared_number = @input_number**2
    
    render("calc_templates/square_results.html.erb")
    
  end
  
  def blank_square_root_form
    
    render ("calc_templates/square_root_form.html.erb")
    
  end
  
  def square_root_form_results
    
    @input_number = params.fetch("user_number").to_f
    @squared_number = @input_number**0.5
    
    render("calc_templates/square_root_results.html.erb")
    
  end
  
  def blank_payment_form
    
    render ("calc_templates/payment_form.html.erb")
    
  end
  
  def payment_form_results
    
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_f
    @principal = params.fetch("user_principal").to_f
    @monthly_payment = (@apr/100/12*@principal)/(1-(1+@apr/100/12)**(-@years*12))
    
    render("calc_templates/payment_results.html.erb")
    
  end  
  
  def blank_random_form
    
    render ("calc_templates/random_form.html.erb")
    
  end
  
  def random_form_results
    
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    @random_number = rand(@min..@max)
    
    render("calc_templates/random_results.html.erb")
    
  end  
  
  def blank_word_count_form
    
    render ("calc_templates/word_count_form.html.erb")
    
  end
  
  def word_count_form_results
    
    @text = params.fetch("user_text").strip
    @special_word = params.fetch("user_special_word")
   
    @word_count = @text.split.count
    @char_count_w_spaces = @text.length
    @char_count_wo_spaces = @text.gsub(/\s+/, "").length
    @special_word_count = @text.upcase.scan(/#{@special_word.upcase}/).count
    
    render("calc_templates/word_count_results.html.erb")
    
  end  
  
  def blank_descriptive_stats_form
    
    render ("calc_templates/descriptive_stats_form.html.erb")
    
  end
  
  def descriptive_stats_form_results
    
    @list = params.fetch("user_list").gsub(",", "").split.map(&:to_f)
    @sorted_list = @list.sort
    @count = @sorted_list.count
    @min = @sorted_list.min
    @max = @sorted_list.max
    @range = @max-@min
   
    @median = 0
    if @sorted_list.length.odd?
    @median = @sorted_list[@sorted_list.length/2] 
    else
    @median=(@sorted_list[@sorted_list.length/2-1]+@sorted_list[@sorted_list.length/2])/2.to_f
    end
    
    @sum = @sorted_list.sum
    @mean = @sum/@sorted_list.length
    
    @squaresum = 0
    @sorted_list.each do |number|
      @squaresum+= (@mean-number)**2
    end
    @variance= @squaresum/@sorted_list.length
    
    @sd = Math.sqrt(@variance)
    
    @mode= @sorted_list[0]
    @sorted_list.each do |number|
      if @sorted_list.count(number) > @sorted_list.count(@mode)
      @mode=number 
      end
    end 
    
    render("calc_templates/descriptive_stats_results.html.erb")
   
  end  
  
end