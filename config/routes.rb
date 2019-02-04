Rails.application.routes.draw do

  get("flexible/square/:number",{:controller => "calc", :action => "flex_square"})
  get("flexible/square_root/:number",{:controller => "calc", :action => "flex_square_root"})
  get("flexible/payment/:rate/:periods/:amount",{:controller => "calc", :action => "flex_payment"})
  get("flexible/random/:min/:max/",{:controller => "calc", :action => "flex_random"})
  
  get("square/new", {:controller => "calc", :action => "blank_square_form"})
  get("square/results", {:controller => "calc", :action => "square_form_results"})
  
  get("square_root/new", {:controller => "calc", :action => "blank_square_root_form"})
  get("square_root/results", {:controller => "calc", :action => "square_root_form_results"})
  
  get("payment/new", {:controller => "calc", :action => "blank_payment_form"})
  get("payment/results", {:controller => "calc", :action => "payment_form_results"})
  
  get("random/new", {:controller => "calc", :action => "blank_random_form"})
  get("random/results", {:controller => "calc", :action => "random_form_results"})
  
  get("word_count/new", {:controller => "calc", :action => "blank_word_count_form"})
  get("word_count/results", {:controller => "calc", :action => "word_count_form_results"})
  
  get("descriptive_stats/new", {:controller => "calc", :action => "blank_descriptive_stats_form"})
  get("descriptive_stats/results", {:controller => "calc", :action => "descriptive_stats_form_results"})
  
end
