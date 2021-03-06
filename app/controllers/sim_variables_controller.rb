class SimVariablesController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  before_filter :find_user
  
  
  # GET /sim_variables
  # GET /sim_variables.xml
  def index
    @sim_variables = @user.sim_variables

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sim_variables }
    end
  end

  # GET /sim_variables/1
  # GET /sim_variables/1.xml
  def show
    @sim_variable = SimVariable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sim_variable }
    end
  end

  # GET /sim_variables/new
  # GET /sim_variables/new.xml
  def new
    @sim_variable = SimVariable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sim_variable }
    end
  end

  # GET /sim_variables/1/edit
  def edit
    @sim_variable = SimVariable.find(params[:id])
  end

  # POST /sim_variables
  # POST /sim_variables.xml
  def create
    @sim_variable = SimVariable.new(params[:sim_variable])

    respond_to do |format|
      if @sim_variable.save
        @user.sim_variables << @sim_variable
        @user.save
        @sim_variable.reload_source
        flash[:notice] = 'SimVariable was successfully created.'
        format.html { redirect_to user_sim_variable_path(@user, @sim_variable) }
        format.xml  { render :xml => @sim_variable, :status => :created, :location => @sim_variable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sim_variable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sim_variables/1
  # PUT /sim_variables/1.xml
  def update
    @sim_variable = SimVariable.find(params[:id])

    respond_to do |format|
      if @sim_variable.update_attributes(params[:sim_variable])
        @sim_variable.reload_source
        flash[:notice] = 'SimVariable was successfully updated.'
        format.html { redirect_to user_sim_variable_path(@user, @sim_variable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sim_variable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sim_variables/1
  # DELETE /sim_variables/1.xml
  def destroy
    @sim_variable = SimVariable.find(params[:id])
    @sim_variable.destroy

    respond_to do |format|
      format.html { redirect_to user_sim_variables_path(@user) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_user
    @user_id = params[:user_id]
    
    if @user_id == nil
      redirect_to users_url
    else
      @user = User.find(@user_id)
    end
  end
end
