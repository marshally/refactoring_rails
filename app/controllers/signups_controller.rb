class SignupsController < ApplicationController
  # GET /users/new
  def new
    @signup = Signup.new
  end


  # POST /users
  # POST /users.json
  def create
    @signup = Signup.new(params[:user])

    respond_to do |format|
      if @signup.save
        format.html { redirect_to @signup.user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @signup.user }
      else
        format.html { render :new }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end
end
