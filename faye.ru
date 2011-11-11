require 'faye'  
faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)  
run faye_server  

#hot to start
#bundle exec rackup faye.ru -s thin -E production 