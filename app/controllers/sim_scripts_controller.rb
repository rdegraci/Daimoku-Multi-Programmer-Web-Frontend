class SimScriptsController < ApplicationController
  # GET /sim_scripts
  # GET /sim_scripts.xml
  def index
    @sim_scripts = SimScript.all

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
        flash[:notice] = 'SimScript was successfully created.'
        format.html { redirect_to(@sim_script) }
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
        flash[:notice] = 'SimScript was successfully updated.'
        format.html { redirect_to(@sim_script) }
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
      format.html { redirect_to(sim_scripts_url) }
      format.xml  { head :ok }
    end
  end
end
