class HomeController < ApplicationController
  def index
  	if current_user
  		redirect_to :user_index
  	end
  end

  def about
  end

  def signup
  	if current_user
  		redirect_to :user_index
  	end
  end

  def login
  	if current_user
      pending
  		#redirect_to :user_index
  	end
  end

end
