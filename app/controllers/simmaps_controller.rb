class SimmapsController < ApplicationController
  # GET /simmaps
  # GET /simmaps.xml
  def index
    @simmaps = Simmap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simmaps }
    end
  end

  # GET /simmaps/1
  # GET /simmaps/1.xml
  def show
    @simmap = Simmap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simmap }
    end
  end

  # GET /simmaps/new
  # GET /simmaps/new.xml
  def new
    @simmap = Simmap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simmap }
    end
  end

  # GET /simmaps/1/edit
  def edit
    @simmap = Simmap.find(params[:id])
  end

  # POST /simmaps
  # POST /simmaps.xml
  def create
    @simmap = Simmap.new(params[:simmap])

    respond_to do |format|
      if @simmap.save
        flash[:notice] = 'Simmap was successfully created.'
        format.html { redirect_to(@simmap) }
        format.xml  { render :xml => @simmap, :status => :created, :location => @simmap }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simmap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simmaps/1
  # PUT /simmaps/1.xml
  def update
    @simmap = Simmap.find(params[:id])

    respond_to do |format|
      if @simmap.update_attributes(params[:simmap])
        flash[:notice] = 'Simmap was successfully updated.'
        format.html { redirect_to(@simmap) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simmap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simmaps/1
  # DELETE /simmaps/1.xml
  def destroy
    @simmap = Simmap.find(params[:id])
    @simmap.destroy

    respond_to do |format|
      format.html { redirect_to(simmaps_url) }
      format.xml  { head :ok }
    end
  end
end
