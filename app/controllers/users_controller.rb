class UsersController < ApplicationController

  filter_resource_access
  
  #filter_access_to :show, :edit, :update, :destroy, :attribute_check => true
  
  # GET /simwests
  # GET /simwests.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @simwests }
    end
  end
  
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
  
  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.roles.create(:title => "guest")
      if @user.save
        flash[:notice] = 'Registration successful.'
        redirect_to login_url
      else
        render :action => "new"
      end

  end

  def edit
    @user = current_user
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = current_user
      if @user.update_attributes(params[:user])
        flash[:notice] = "Successfully updated profile."
        redirect_to root_url
      else
        render :action => "edit" 
      end

  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = current_user
    @user.destroy
    flash[:notice] = "Successfully updated profile."
    

    redirect_to root_url

  end
  
  def site_home
  end
  
end
