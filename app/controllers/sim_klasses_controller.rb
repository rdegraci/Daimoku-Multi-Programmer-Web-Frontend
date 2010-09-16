class SimKlassesController < ApplicationController
  
  # Model Security
  filter_resource_access
  
  before_filter :find_user
  
  # GET /sim_klasses
  # GET /sim_klasses.xml
  def index
    @sim_klasses = @user.sim_klasses

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
        @user.sim_klasses << @sim_klass
        @user.save
        @sim_klass.reload_source
        flash[:notice] = 'SimKlass was successfully created.'
        format.html { redirect_to user_sim_klass_path(@user,@sim_klass) }
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
        @sim_klass.reload_source
        flash[:notice] = 'SimKlass was successfully updated.'
        format.html { redirect_to user_sim_klass_path(@user, @sim_klass) }
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
      format.html { redirect_to user_sim_klasses_path(@user) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def find_user
    @user_id = params[:user_id]
    
    if @user_id == nil
      redirect_to users_url
    else
      @user = User.find(@user_id)
    end
  end
end
