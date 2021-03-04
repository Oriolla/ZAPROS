class SessionsController < ApplicationController

  def new
  end

  def create
    unless params[:session].blank?
      user = User.find_by(email: params[:session][:email].downcase)

      # не работает user.authenticate(params[:session][:password])
      sha1_password = Digest::SHA1.hexdigest(params[:session][:password]).to_s

      if user && user.authenticate(sha1_password)
        # Sign the user in and redirect to the user's show page.
        sign_in user
        redirect_to work_url  # goto work place
        # redirect_to user  # previous

      else
        # Create an error message and re-render the signin form.
        flash.now[:alert] = 'Login failed. Invalid email/password combination. Repeat'
        # Not quite right!
        render 'new'
      end
    end

  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
