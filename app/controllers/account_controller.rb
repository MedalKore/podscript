class AccountController < ApplicationController
	layout 'user_application'

  def index
  end

  def place_an_order
  	is_current_user_nil
    @collection
  end

  def past_orders
  	is_current_user_nil
  	@orders = current_user.orders
  end

  def pending_orders
  	is_current_user_nil
  	@pending_orders = current_user.orders.where(transcript: :nil)
  end

  def account_details
  	is_current_user_nil
  end

  def create_order
  	@order = Order.create(user_id: current_user.id)

  end


  def create
  	email = params[:user][:email]
  	password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]
  	first_name = params[:user][:first_name]
  	last_name = params[:user][:last_name]
  	user = User.create(email: email, first_name: first_name, last_name: last_name,
  		password: password, password_confirmation: password_confirmation)
  	if sign_in(user)
	  	redirect_to :place_an_order
	  end
  end

 	private

 	def is_current_user_nil
 		if current_user.nil?
  		redirect_to :root
  		return
  	end
 	end

 	  def sign_in(user)
    cookies.permanent[:auth_token] = {
    	value: user.auth_token
    }
    current_user = user
  end

end
