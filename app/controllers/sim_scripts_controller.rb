class SimScriptsController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  before_filter :find_user
  
  # GET /sim_scripts
  # GET /sim_scripts.xml
  def index
    @sim_scripts = @user.sim_scripts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sim_scripts }
    end
  end

  # GET /sim_scripts/1
  # GET /sim_scripts/1.xml
  def show
    @sim_script = SimScript.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sim_script }
    end
  end

  # GET /sim_scripts/new
  # GET /sim_scripts/new.xml
  def new
    @sim_script = SimScript.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sim_script }
    end
  end

  # GET /sim_scripts/1/edit
  def edit
    @sim_script = SimScript.find(params[:id])
  end

  # POST /sim_scripts
  # POST /sim_scripts.xml
  def create
    @sim_script = SimScript.new(params[:sim_script])

    respond_to do |format|
      if @sim_script.save
        @user.sim_scripts << @sim_script
        @user.save
        @sim_script.reload_source
        flash[:notice] = 'SimScript was successfully created.'
        format.html { redirect_to user_sim_script_path(@user,@sim_script) }
        format.xml  { render :xml => @sim_script, :status => :created, :location => @sim_script }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sim_script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sim_scripts/1
  # PUT /sim_scripts/1.xml
  def update
    @sim_script = SimScript.find(params[:id])

    respond_to do |format|
      if @sim_script.update_attributes(params[:sim_script])
        @sim_script.reload_source
        flash[:notice] = 'SimScript was successfully updated.'
        format.html { redirect_to user_sim_script_path(@user,@sim_script) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sim_script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sim_scripts/1
  # DELETE /sim_scripts/1.xml
  def destroy
    @sim_script = SimScript.find(params[:id])
    @sim_script.destroy

    respond_to do |format|
      format.html { redirect_to user_sim_scripts_path(@user) }
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
