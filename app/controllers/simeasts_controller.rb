class SimeastsController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  # GET /simeasts
  # GET /simeasts.xml
  def index
    @simeasts = Simeast.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simeasts }
    end
  end

  # GET /simeasts/1
  # GET /simeasts/1.xml
  def show
    @simeast = Simeast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simeast }
    end
  end

  # GET /simeasts/new
  # GET /simeasts/new.xml
  def new
    @simeast = Simeast.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simeast }
    end
  end

  # GET /simeasts/1/edit
  def edit
    @simeast = Simeast.find(params[:id])
  end

  # POST /simeasts
  # POST /simeasts.xml
  def create
    @simeast = Simeast.new(params[:simeast])

    respond_to do |format|
      if @simeast.save
        flash[:notice] = 'Simeast was successfully created.'
        format.html { redirect_to(@simeast) }
        format.xml  { render :xml => @simeast, :status => :created, :location => @simeast }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simeast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simeasts/1
  # PUT /simeasts/1.xml
  def update
    @simeast = Simeast.find(params[:id])

    respond_to do |format|
      if @simeast.update_attributes(params[:simeast])
        flash[:notice] = 'Simeast was successfully updated.'
        format.html { redirect_to(@simeast) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simeast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simeasts/1
  # DELETE /simeasts/1.xml
  def destroy
    @simeast = Simeast.find(params[:id])
    @simeast.destroy

    respond_to do |format|
      format.html { redirect_to(simeasts_url) }
      format.xml  { head :ok }
    end
  end
end
