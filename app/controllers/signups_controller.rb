class SignupsController < ApplicationController
  # GET /users/new
  def new
    @signup_form = Signup.new
    @user = @signup_form.user
  end


  # POST /users
  # POST /users.json
  def create
    @signup_form = Signup.new(params[:user])
    @account = @signup_form.account
    @user = @signup_form.user

    respond_to do |format|
      if @signup_form.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @signup_form.errors, status: :unprocessable_entity }
      end
    end
  end
end
