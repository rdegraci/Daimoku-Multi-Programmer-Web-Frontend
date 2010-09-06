class SimupsController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  # GET /simups
  # GET /simups.xml
  def index
    @simups = Simup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simups }
    end
  end

  # GET /simups/1
  # GET /simups/1.xml
  def show
    @simup = Simup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simup }
    end
  end

  # GET /simups/new
  # GET /simups/new.xml
  def new
    @simup = Simup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simup }
    end
  end

  # GET /simups/1/edit
  def edit
    @simup = Simup.find(params[:id])
  end

  # POST /simups
  # POST /simups.xml
  def create
    @simup = Simup.new(params[:simup])

    respond_to do |format|
      if @simup.save
        flash[:notice] = 'Simup was successfully created.'
        format.html { redirect_to(@simup) }
        format.xml  { render :xml => @simup, :status => :created, :location => @simup }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simups/1
  # PUT /simups/1.xml
  def update
    @simup = Simup.find(params[:id])

    respond_to do |format|
      if @simup.update_attributes(params[:simup])
        flash[:notice] = 'Simup was successfully updated.'
        format.html { redirect_to(@simup) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simups/1
  # DELETE /simups/1.xml
  def destroy
    @simup = Simup.find(params[:id])
    @simup.destroy

    respond_to do |format|
      format.html { redirect_to(simups_url) }
      format.xml  { head :ok }
    end
  end
end
