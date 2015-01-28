class SessionsController < ApplicationController

  def create
  	if current_user
  		redirect_to :user_index
  	else
  		user = User.find_by(email: params[:log_in][:email])
  		if user.nil?
  			#TODO lookup how to put links in flash messages
  			flash[:error] = "We don't have that email in our system. We would love for you to sign up or you can try again with a different email."
  			redirect_to :login
  		else user.authenticate(params[:log_in][:password])
  			sign_in user
  			redirect_to :user_index
  			return
  		end
  	end
  end

  def delete
  	sign_out
  	redirect_to :root
  end


  private

  def sign_in(user)
    cookies.permanent[:auth_token] = {
    	value: user.auth_token
    }
    current_user = user
  end

  def sign_out
  	cookies.delete(:auth_token)
  end
end
