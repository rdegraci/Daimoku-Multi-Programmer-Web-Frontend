class SimkeysController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  # GET /simkeys
  # GET /simkeys.xml
  def index
    @simkeys = Simkey.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simkeys }
    end
  end

  # GET /simkeys/1
  # GET /simkeys/1.xml
  def show
    @simkey = Simkey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simkey }
    end
  end

  # GET /simkeys/new
  # GET /simkeys/new.xml
  def new
    @simkey = Simkey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simkey }
    end
  end

  # GET /simkeys/1/edit
  def edit
    @simkey = Simkey.find(params[:id])
  end

  # POST /simkeys
  # POST /simkeys.xml
  def create
    @simkey = Simkey.new(params[:simkey])

    respond_to do |format|
      if @simkey.save
        flash[:notice] = 'Simkey was successfully created.'
        format.html { redirect_to(@simkey) }
        format.xml  { render :xml => @simkey, :status => :created, :location => @simkey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simkey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simkeys/1
  # PUT /simkeys/1.xml
  def update
    @simkey = Simkey.find(params[:id])

    respond_to do |format|
      if @simkey.update_attributes(params[:simkey])
        flash[:notice] = 'Simkey was successfully updated.'
        format.html { redirect_to(@simkey) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simkey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simkeys/1
  # DELETE /simkeys/1.xml
  def destroy
    @simkey = Simkey.find(params[:id])
    @simkey.destroy

    respond_to do |format|
      format.html { redirect_to(simkeys_url) }
      format.xml  { head :ok }
    end
  end
end
