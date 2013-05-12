class CompanyController < ApplicationController
  # GET /companys
  # GET /companys.json
  def index
    
  end
  
  # GET /companys/1
  # GET /companys/1.json
  def show
    @company = Company.find(params[:id])

    redirect_to @company.user
  end

  # GET /companys/new
  # GET /companys/new.json
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  # GET /companys/1/edit
  def edit
    @company = Company.find(params[:id])
    @details = @company
    @user = @company.user
    if !authorize_edit(@user)
      render :template => "session/restricted"
    end
  end

  # POST /companys
  # POST /companys.json
  def create
    @company = Company.new(params[:company])
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PUT /companys/1
  # PUT /companys/1.json
  def update
    @company = Company.find(params[:id])
    @details = @company
    @user = @company.user
    
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company.user, notice: 'company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit"}
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companys/1
  # DELETE /companys/1.json
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companys_url }
      format.json { head :no_content }
    end
  end
end
