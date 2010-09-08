class SimKlassesController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  # GET /sim_klasses
  # GET /sim_klasses.xml
  def index
    @sim_klasses = SimKlass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sim_klasses }
    end
  end

  # GET /sim_klasses/1
  # GET /sim_klasses/1.xml
  def show
    @sim_klass = SimKlass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sim_klass }
    end
  end

  # GET /sim_klasses/new
  # GET /sim_klasses/new.xml
  def new
    @sim_klass = SimKlass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sim_klass }
    end
  end

  # GET /sim_klasses/1/edit
  def edit
    @sim_klass = SimKlass.find(params[:id])
  end

  # POST /sim_klasses
  # POST /sim_klasses.xml
  def create
    @sim_klass = SimKlass.new(params[:sim_klass])

    respond_to do |format|
      if @sim_klass.save
       SimKlass::load_klass @sim_klass.name
        flash[:notice] = 'SimKlass was successfully created.'
        format.html { redirect_to(@sim_klass) }
        format.xml  { render :xml => @sim_klass, :status => :created, :location => @sim_klass }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sim_klass.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sim_klasses/1
  # PUT /sim_klasses/1.xml
  def update
    @sim_klass = SimKlass.find(params[:id])

    respond_to do |format|
      if @sim_klass.update_attributes(params[:sim_klass])
        @sim_klass.reload_klass
        flash[:notice] = 'SimKlass was successfully updated.'
        format.html { redirect_to(@sim_klass) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sim_klass.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sim_klasses/1
  # DELETE /sim_klasses/1.xml
  def destroy
    @sim_klass = SimKlass.find(params[:id])
    @sim_klass.destroy

    respond_to do |format|
      format.html { redirect_to(sim_klasses_url) }
      format.xml  { head :ok }
    end
  end
end
