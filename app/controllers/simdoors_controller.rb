class SimdoorsController < ApplicationController
  # GET /simdoors
  # GET /simdoors.xml
  def index
    @simdoors = Simdoor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simdoors }
    end
  end

  # GET /simdoors/1
  # GET /simdoors/1.xml
  def show
    @simdoor = Simdoor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simdoor }
    end
  end

  # GET /simdoors/new
  # GET /simdoors/new.xml
  def new
    @simdoor = Simdoor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simdoor }
    end
  end

  # GET /simdoors/1/edit
  def edit
    @simdoor = Simdoor.find(params[:id])
  end

  # POST /simdoors
  # POST /simdoors.xml
  def create
    @simdoor = Simdoor.new(params[:simdoor])

    respond_to do |format|
      if @simdoor.save
        flash[:notice] = 'Simdoor was successfully created.'
        format.html { redirect_to(@simdoor) }
        format.xml  { render :xml => @simdoor, :status => :created, :location => @simdoor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simdoor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simdoors/1
  # PUT /simdoors/1.xml
  def update
    @simdoor = Simdoor.find(params[:id])

    respond_to do |format|
      if @simdoor.update_attributes(params[:simdoor])
        flash[:notice] = 'Simdoor was successfully updated.'
        format.html { redirect_to(@simdoor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simdoor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simdoors/1
  # DELETE /simdoors/1.xml
  def destroy
    @simdoor = Simdoor.find(params[:id])
    @simdoor.destroy

    respond_to do |format|
      format.html { redirect_to(simdoors_url) }
      format.xml  { head :ok }
    end
  end
end
