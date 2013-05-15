#require 'rubygems'
#require 'bundler'
#Bundler.require
require 'faye'
 
#require File.expand_path('../config/initializers/faye_token.rb', __FILE__)
Faye::WebSocket.load_adapter('thin')
faye = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
#faye.listen(9292)


run faye
