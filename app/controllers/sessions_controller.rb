class SessionsController < ApplicationController
	def create
		user = User.find_by(email: params[:email].downcase)
		if user && user.authenticate(params[:password])
      		# Sign the user in and redirect to the user's show page.
    		sign_in user
    		redirect_to user
    	else
      		if (!user)
      			flash.now[:error] = 'Invalid email' # Not quite right!
      		else
      			flash.now[:error] = 'Invalid password'
      		end
      		render 'new'
    	end
	end

	def destroy 
    sign_out 
    redirect_to root_url
  end

end

