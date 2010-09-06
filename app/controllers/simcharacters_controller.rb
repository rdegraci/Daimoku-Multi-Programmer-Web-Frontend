class SimcharactersController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  # GET /simcharacters
  # GET /simcharacters.xml
  def index
    @simcharacters = Simcharacter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simcharacters }
    end
  end

  # GET /simcharacters/1
  # GET /simcharacters/1.xml
  def show
    @simcharacter = Simcharacter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simcharacter }
    end
  end

  # GET /simcharacters/new
  # GET /simcharacters/new.xml
  def new
    @simcharacter = Simcharacter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simcharacter }
    end
  end

  # GET /simcharacters/1/edit
  def edit
    @simcharacter = Simcharacter.find(params[:id])
  end

  # POST /simcharacters
  # POST /simcharacters.xml
  def create
    @simcharacter = Simcharacter.new(params[:simcharacter])

    respond_to do |format|
      if @simcharacter.save
        flash[:notice] = 'Simcharacter was successfully created.'
        format.html { redirect_to(@simcharacter) }
        format.xml  { render :xml => @simcharacter, :status => :created, :location => @simcharacter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simcharacter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simcharacters/1
  # PUT /simcharacters/1.xml
  def update
    @simcharacter = Simcharacter.find(params[:id])

    respond_to do |format|
      if @simcharacter.update_attributes(params[:simcharacter])
        flash[:notice] = 'Simcharacter was successfully updated.'
        format.html { redirect_to(@simcharacter) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simcharacter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simcharacters/1
  # DELETE /simcharacters/1.xml
  def destroy
    @simcharacter = Simcharacter.find(params[:id])
    @simcharacter.destroy

    respond_to do |format|
      format.html { redirect_to(simcharacters_url) }
      format.xml  { head :ok }
    end
  end
end
