class SimModulesController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  # GET /sim_modules
  # GET /sim_modules.xml
  def index
    @sim_modules = SimModule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sim_modules }
    end
  end

  # GET /sim_modules/1
  # GET /sim_modules/1.xml
  def show
    @sim_module = SimModule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sim_module }
    end
  end

  # GET /sim_modules/new
  # GET /sim_modules/new.xml
  def new
    @sim_module = SimModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sim_module }
    end
  end

  # GET /sim_modules/1/edit
  def edit
    @sim_module = SimModule.find(params[:id])
  end

  # POST /sim_modules
  # POST /sim_modules.xml
  def create
    @sim_module = SimModule.new(params[:sim_module])

    respond_to do |format|
      if @sim_module.save
        flash[:notice] = 'SimModule was successfully created.'
        format.html { redirect_to(@sim_module) }
        format.xml  { render :xml => @sim_module, :status => :created, :location => @sim_module }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sim_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sim_modules/1
  # PUT /sim_modules/1.xml
  def update
    @sim_module = SimModule.find(params[:id])

    respond_to do |format|
      if @sim_module.update_attributes(params[:sim_module])
        flash[:notice] = 'SimModule was successfully updated.'
        format.html { redirect_to(@sim_module) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sim_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sim_modules/1
  # DELETE /sim_modules/1.xml
  def destroy
    @sim_module = SimModule.find(params[:id])
    @sim_module.destroy

    respond_to do |format|
      format.html { redirect_to(sim_modules_url) }
      format.xml  { head :ok }
    end
  end
end
