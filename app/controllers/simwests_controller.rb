class SimwestsController < ApplicationController
  # GET /simwests
  # GET /simwests.xml
  def index
    @simwests = Simwest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simwests }
    end
  end

  # GET /simwests/1
  # GET /simwests/1.xml
  def show
    @simwest = Simwest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simwest }
    end
  end

  # GET /simwests/new
  # GET /simwests/new.xml
  def new
    @simwest = Simwest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simwest }
    end
  end

  # GET /simwests/1/edit
  def edit
    @simwest = Simwest.find(params[:id])
  end

  # POST /simwests
  # POST /simwests.xml
  def create
    @simwest = Simwest.new(params[:simwest])

    respond_to do |format|
      if @simwest.save
        flash[:notice] = 'Simwest was successfully created.'
        format.html { redirect_to(@simwest) }
        format.xml  { render :xml => @simwest, :status => :created, :location => @simwest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simwest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simwests/1
  # PUT /simwests/1.xml
  def update
    @simwest = Simwest.find(params[:id])

    respond_to do |format|
      if @simwest.update_attributes(params[:simwest])
        flash[:notice] = 'Simwest was successfully updated.'
        format.html { redirect_to(@simwest) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simwest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simwests/1
  # DELETE /simwests/1.xml
  def destroy
    @simwest = Simwest.find(params[:id])
    @simwest.destroy

    respond_to do |format|
      format.html { redirect_to(simwests_url) }
      format.xml  { head :ok }
    end
  end
end
