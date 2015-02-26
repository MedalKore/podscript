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
  	order = current_user.orders.build
    order.last_4 = current_user.last_4
    order = order.update_attributes(params[:order])
    podcast = params[:order][:podcast]
    
    # credentials = Aws::Credentials(ENV['AWS_access_key_id'], ENV['AWS_secret_access_key'], session_token = nil)
    # s3 = Aws::S3::Resource.new(region: 'us-west-2', credentials: credentials)
    # bucket = s3.bucket('techscripts-podcasts')
    # bucket.object("#{current_user.email}/#{podcast}")

    # Stripe::Charge.create(amount: )
    redirect_to :pending_orders
  end

  def update_account_details
    redirect_to :account_details
  end

  def create
  	user = User.create(params[:user])
  	if sign_in(user)
	  	redirect_to :place_an_order
	  end
  end

  def update
    current_user.update_attributes(params[:user])
  end

  def create_or_update_stripe_token
    current_user.save_stripe_customer params[:stripe_card_token]
    flash[:notice] = 'Your card updated successfully!'
    redirect_to :account_details
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
