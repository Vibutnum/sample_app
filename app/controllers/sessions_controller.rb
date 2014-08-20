# encoding: utf-8
class SessionsController < ApplicationController
	def new
		
	end

	def create
	  user = User.find_by(name: params[:session][:name].downcase)
      if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_back_or user
      else
        flash.now[:error] = '您输入的账户与密码不匹配' 
        render 'new'
      end
		
	end

	def destroy
	  sign_out
	  redirect_to root_path
	end
end
