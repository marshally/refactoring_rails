class SignupsController < ApplicationController
  # GET /users/new
  def new
    @signup = Signup.new
    @user = @signup.user
  end


  # POST /users
  # POST /users.json
  def create
    @signup = Signup.new(params[:user])
    @account = @signup.account
    @user = @signup.user

    respond_to do |format|
      if @signup.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end
end
