class SimdownsController < ApplicationController
  # GET /simdowns
  # GET /simdowns.xml
  def index
    @simdowns = Simdown.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simdowns }
    end
  end

  # GET /simdowns/1
  # GET /simdowns/1.xml
  def show
    @simdown = Simdown.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simdown }
    end
  end

  # GET /simdowns/new
  # GET /simdowns/new.xml
  def new
    @simdown = Simdown.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simdown }
    end
  end

  # GET /simdowns/1/edit
  def edit
    @simdown = Simdown.find(params[:id])
  end

  # POST /simdowns
  # POST /simdowns.xml
  def create
    @simdown = Simdown.new(params[:simdown])

    respond_to do |format|
      if @simdown.save
        flash[:notice] = 'Simdown was successfully created.'
        format.html { redirect_to(@simdown) }
        format.xml  { render :xml => @simdown, :status => :created, :location => @simdown }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simdowns/1
  # PUT /simdowns/1.xml
  def update
    @simdown = Simdown.find(params[:id])

    respond_to do |format|
      if @simdown.update_attributes(params[:simdown])
        flash[:notice] = 'Simdown was successfully updated.'
        format.html { redirect_to(@simdown) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simdown.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simdowns/1
  # DELETE /simdowns/1.xml
  def destroy
    @simdown = Simdown.find(params[:id])
    @simdown.destroy

    respond_to do |format|
      format.html { redirect_to(simdowns_url) }
      format.xml  { head :ok }
    end
  end
end
