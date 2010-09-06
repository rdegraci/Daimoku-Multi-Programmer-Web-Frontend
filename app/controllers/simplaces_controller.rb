class SimplacesController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  # GET /simplaces
  # GET /simplaces.xml
  def index
    @simplaces = Simplace.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simplaces }
    end
  end

  # GET /simplaces/1
  # GET /simplaces/1.xml
  def show
    @simplace = Simplace.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simplace }
    end
  end

  # GET /simplaces/new
  # GET /simplaces/new.xml
  def new
    @simplace = Simplace.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simplace }
    end
  end

  # GET /simplaces/1/edit
  def edit
    @simplace = Simplace.find(params[:id])
  end

  # POST /simplaces
  # POST /simplaces.xml
  def create
    @simplace = Simplace.new(params[:simplace])

    respond_to do |format|
      if @simplace.save
        flash[:notice] = 'Simplace was successfully created.'
        format.html { redirect_to(@simplace) }
        format.xml  { render :xml => @simplace, :status => :created, :location => @simplace }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simplace.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simplaces/1
  # PUT /simplaces/1.xml
  def update
    @simplace = Simplace.find(params[:id])

    respond_to do |format|
      if @simplace.update_attributes(params[:simplace])
        flash[:notice] = 'Simplace was successfully updated.'
        format.html { redirect_to(@simplace) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simplace.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simplaces/1
  # DELETE /simplaces/1.xml
  def destroy
    @simplace = Simplace.find(params[:id])
    @simplace.destroy

    respond_to do |format|
      format.html { redirect_to(simplaces_url) }
      format.xml  { head :ok }
    end
  end
end
