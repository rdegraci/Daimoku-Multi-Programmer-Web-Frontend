class SimsouthsController < ApplicationController
  # GET /simsouths
  # GET /simsouths.xml
  def index
    @simsouths = Simsouth.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simsouths }
    end
  end

  # GET /simsouths/1
  # GET /simsouths/1.xml
  def show
    @simsouth = Simsouth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simsouth }
    end
  end

  # GET /simsouths/new
  # GET /simsouths/new.xml
  def new
    @simsouth = Simsouth.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simsouth }
    end
  end

  # GET /simsouths/1/edit
  def edit
    @simsouth = Simsouth.find(params[:id])
  end

  # POST /simsouths
  # POST /simsouths.xml
  def create
    @simsouth = Simsouth.new(params[:simsouth])

    respond_to do |format|
      if @simsouth.save
        flash[:notice] = 'Simsouth was successfully created.'
        format.html { redirect_to(@simsouth) }
        format.xml  { render :xml => @simsouth, :status => :created, :location => @simsouth }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simsouth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simsouths/1
  # PUT /simsouths/1.xml
  def update
    @simsouth = Simsouth.find(params[:id])

    respond_to do |format|
      if @simsouth.update_attributes(params[:simsouth])
        flash[:notice] = 'Simsouth was successfully updated.'
        format.html { redirect_to(@simsouth) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simsouth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simsouths/1
  # DELETE /simsouths/1.xml
  def destroy
    @simsouth = Simsouth.find(params[:id])
    @simsouth.destroy

    respond_to do |format|
      format.html { redirect_to(simsouths_url) }
      format.xml  { head :ok }
    end
  end
end
