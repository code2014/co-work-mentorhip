class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    #user = User.find(:all, :conditions => "details_type = 'Company' OR 'Individual'")
    if params[:within].present? && (params[:within].to_i > 0)
      @q = User.near(params[:city], params[:within]).search(params[:q])
    else
      @q = User.search(params[:q])
    end
    #@q = @q.all(:conditions => "details_type = 'Company' OR 'Individual'")
    @users = @q.result(:distinct => true).page(params[:page]).per(20)  
    #@json = User.all.to_gmaps4rails
    @json = @users.to_gmaps4rails

  end

  # def compindex
  #  if params[:q].present?
  #    @companies = Company.near(params[:q], 50, :order => :distance)
  #  else
  #    @companies = Company.all
  #  end
  # end


  def search
    index
    render :index
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
	  format.json { render json: @user.courses }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @details = @user.details
    if !authorize_edit(@user)
      render :template => "session/restricted"
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        #UserMailer.registration_confirmation(@user).deliver
        cookies[:user_token] = {:value => @user.token}
        format.html { redirect_to users_chooseType_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def chooseType
  end
  def verifyemail
    @user = User.find_by_token(params[:user_token])
    @user.emailverified = true
    @user.save
    format.html { redirect_to edit_user_path(@user), notice: 'Email was successfully verified' }
    format.json { head :no_content }
  end
  
  def choseType
    @type = params[:commit]
    @user = current_user
    if (@type == "Company")
      @user.details = Company.new
      @user.save
    elsif (@type == "Individual")
      @user.details = Individual.new
      @user.save
    elsif (@type == "Parent/Student")
      @user.details = Purchaser.new
      @user.save
    end
    redirect_to edit_user_path(@user)
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
