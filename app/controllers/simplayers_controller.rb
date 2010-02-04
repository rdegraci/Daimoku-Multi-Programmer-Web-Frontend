class SimplayersController < ApplicationController
  # GET /simplayers
  # GET /simplayers.xml
  def index
    @simplayers = Simplayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simplayers }
    end
  end

  # GET /simplayers/1
  # GET /simplayers/1.xml
  def show
    @simplayer = Simplayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simplayer }
    end
  end

  # GET /simplayers/new
  # GET /simplayers/new.xml
  def new
    @simplayer = Simplayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simplayer }
    end
  end

  # GET /simplayers/1/edit
  def edit
    @simplayer = Simplayer.find(params[:id])
  end

  # POST /simplayers
  # POST /simplayers.xml
  def create
    @simplayer = Simplayer.new(params[:simplayer])

    respond_to do |format|
      if @simplayer.save
        flash[:notice] = 'Simplayer was successfully created.'
        format.html { redirect_to(@simplayer) }
        format.xml  { render :xml => @simplayer, :status => :created, :location => @simplayer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simplayer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simplayers/1
  # PUT /simplayers/1.xml
  def update
    @simplayer = Simplayer.find(params[:id])

    respond_to do |format|
      if @simplayer.update_attributes(params[:simplayer])
        flash[:notice] = 'Simplayer was successfully updated.'
        format.html { redirect_to(@simplayer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simplayer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simplayers/1
  # DELETE /simplayers/1.xml
  def destroy
    @simplayer = Simplayer.find(params[:id])
    @simplayer.destroy

    respond_to do |format|
      format.html { redirect_to(simplayers_url) }
      format.xml  { head :ok }
    end
  end
end
