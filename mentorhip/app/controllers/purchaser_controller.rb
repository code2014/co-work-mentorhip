class PurchaserController < ApplicationController
  # GET /purchasers
  # GET /purchasers.json
  def index
  end
  
  # GET /purchasers/1
  # GET /purchasers/1.json
  def show
    @purchaser = Purchaser.find(params[:id])

    redirect_to @purchaser.user
  end

  # GET /purchasers/new
  # GET /purchasers/new.json
  def new
    @purchaser = Purchaser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchaser }
    end
  end

  # GET /purchasers/1/edit
  def edit
    @purchaser = Purchaser.find(params[:id])
    @details = @purchaser
    @user = @purchaser.user
    if !authorize_edit(@user)
      render :template => "session/restricted"
    end
  end

  # POST /purchasers
  # POST /purchasers.json
  def create
    @purchaser = Purchaser.new(params[:purchaser])
    respond_to do |format|
      if @purchaser.save
        format.html { redirect_to @purchaser, notice: 'purchaser was successfully created.' }
        format.json { render json: @purchaser, status: :created, location: @purchaser }
      else
        format.html { render action: "new" }
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /purchasers/1
  # PUT /purchasers/1.json
  def update
    @purchaser = Purchaser.find(params[:id])
    @details = @purchaser
    @user = @purchaser.user
    
    respond_to do |format|
      if @purchaser.update_attributes(params[:purchaser])
        format.html { redirect_to @purchaser.user, notice: 'purchaser was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit"}
        format.json { render json: @purchaser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchasers/1
  # DELETE /purchasers/1.json
  def destroy
    @purchaser = Purchaser.find(params[:id])
    @purchaser.destroy

    respond_to do |format|
      format.html { redirect_to purchasers_url }
      format.json { head :no_content }
    end
  end
end
