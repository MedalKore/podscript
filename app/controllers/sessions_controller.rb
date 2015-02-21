class SessionsController < ApplicationController

  def create
  	if current_user
      if current_user.pending_orders
        redirect_to :pending_orders
      else
        redirect_to :user_index
      end
  	else
  		user = User.find_by(email: params[:log_in][:email])
  		if user.nil?
  			#TODO lookup how to put links in flash messages
  			flash[:error] = "We don't have that email in our system. We would love for you to sign up or you can try again with a different email."
  			redirect_to :login
  		else user.authenticate(params[:log_in][:password])
  			sign_in user
        if current_user.pending_orders.first
          redirect_to :pending_orders
        else
          redirect_to :user_index
        end
        return
  		end
  	end
  end

  def delete
    cookies.delete(:auth_token)
  	redirect_to :root
  end


  private

  def sign_in(user)
    cookies.permanent[:auth_token] = {
    	value: user.auth_token
    }
    current_user = user
  end
end
