class SimnorthsController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  
  # GET /simnorths
  # GET /simnorths.xml
  def index
    @simnorths = Simnorth.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simnorths }
    end
  end

  # GET /simnorths/1
  # GET /simnorths/1.xml
  def show
    @simnorth = Simnorth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simnorth }
    end
  end

  # GET /simnorths/new
  # GET /simnorths/new.xml
  def new
    @simnorth = Simnorth.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simnorth }
    end
  end

  # GET /simnorths/1/edit
  def edit
    @simnorth = Simnorth.find(params[:id])
  end

  # POST /simnorths
  # POST /simnorths.xml
  def create
    @simnorth = Simnorth.new(params[:simnorth])

    respond_to do |format|
      if @simnorth.save
        flash[:notice] = 'Simnorth was successfully created.'
        format.html { redirect_to(@simnorth) }
        format.xml  { render :xml => @simnorth, :status => :created, :location => @simnorth }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simnorth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simnorths/1
  # PUT /simnorths/1.xml
  def update
    @simnorth = Simnorth.find(params[:id])

    respond_to do |format|
      if @simnorth.update_attributes(params[:simnorth])
        flash[:notice] = 'Simnorth was successfully updated.'
        format.html { redirect_to(@simnorth) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simnorth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simnorths/1
  # DELETE /simnorths/1.xml
  def destroy
    @simnorth = Simnorth.find(params[:id])
    @simnorth.destroy

    respond_to do |format|
      format.html { redirect_to(simnorths_url) }
      format.xml  { head :ok }
    end
  end
end
