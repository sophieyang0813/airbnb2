class HelloController < ApplicationController
	def welcome
  	render template: "hello/welcome"
  	end 

  	def haha
    render template: "hello/haha"
  	end 
end