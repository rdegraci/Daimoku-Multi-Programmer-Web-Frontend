class SimthingsController < ApplicationController
  # GET /simthings
  # GET /simthings.xml
  def index
    @simthings = Simthing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simthings }
    end
  end

  # GET /simthings/1
  # GET /simthings/1.xml
  def show
    @simthing = Simthing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simthing }
    end
  end

  # GET /simthings/new
  # GET /simthings/new.xml
  def new
    @simthing = Simthing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simthing }
    end
  end

  # GET /simthings/1/edit
  def edit
    @simthing = Simthing.find(params[:id])
  end

  # POST /simthings
  # POST /simthings.xml
  def create
    @simthing = Simthing.new(params[:simthing])

    respond_to do |format|
      if @simthing.save
        flash[:notice] = 'Simthing was successfully created.'
        format.html { redirect_to(@simthing) }
        format.xml  { render :xml => @simthing, :status => :created, :location => @simthing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simthing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simthings/1
  # PUT /simthings/1.xml
  def update
    @simthing = Simthing.find(params[:id])

    respond_to do |format|
      if @simthing.update_attributes(params[:simthing])
        flash[:notice] = 'Simthing was successfully updated.'
        format.html { redirect_to(@simthing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simthing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simthings/1
  # DELETE /simthings/1.xml
  def destroy
    @simthing = Simthing.find(params[:id])
    @simthing.destroy

    respond_to do |format|
      format.html { redirect_to(simthings_url) }
      format.xml  { head :ok }
    end
  end
end
