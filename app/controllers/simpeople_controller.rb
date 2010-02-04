class SimpeopleController < ApplicationController
  # GET /simpeople
  # GET /simpeople.xml
  def index
    @simpeople = Simperson.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simpeople }
    end
  end

  # GET /simpeople/1
  # GET /simpeople/1.xml
  def show
    @simperson = Simperson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @simperson }
    end
  end

  # GET /simpeople/new
  # GET /simpeople/new.xml
  def new
    @simperson = Simperson.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @simperson }
    end
  end

  # GET /simpeople/1/edit
  def edit
    @simperson = Simperson.find(params[:id])
  end

  # POST /simpeople
  # POST /simpeople.xml
  def create
    @simperson = Simperson.new(params[:simperson])

    respond_to do |format|
      if @simperson.save
        flash[:notice] = 'Simperson was successfully created.'
        format.html { redirect_to(@simperson) }
        format.xml  { render :xml => @simperson, :status => :created, :location => @simperson }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @simperson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /simpeople/1
  # PUT /simpeople/1.xml
  def update
    @simperson = Simperson.find(params[:id])

    respond_to do |format|
      if @simperson.update_attributes(params[:simperson])
        flash[:notice] = 'Simperson was successfully updated.'
        format.html { redirect_to(@simperson) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @simperson.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /simpeople/1
  # DELETE /simpeople/1.xml
  def destroy
    @simperson = Simperson.find(params[:id])
    @simperson.destroy

    respond_to do |format|
      format.html { redirect_to(simpeople_url) }
      format.xml  { head :ok }
    end
  end
end
