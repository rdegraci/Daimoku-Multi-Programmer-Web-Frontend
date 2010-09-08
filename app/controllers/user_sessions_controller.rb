class UserSessionsController < ApplicationController

  filter_resource_access
  
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new
    @simplayers = Simplayer.all
    @simcharacters = Simcharacter.all
    @simthings = Simthing.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end
  
  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    @user_session = UserSession.new(params[:user_session])
    @simplayers = Simplayer.all
    @simcharacters = Simcharacter.all
    @simthings = Simthing.all
    
    respond_to do |format|
      if @user_session.save
        flash[:notice] = "Successfully logged in."        
        @user = User.find_by_username(params[:user_session][:username])
        format.html { redirect_to(@user) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    if @user_session == nil
      redirect_to(root_url)
    else
      @user_session.destroy

      flash[:notice] = 'Successful logout.'
      respond_to do |format|
        format.html { redirect_to(root_url) }
        format.xml  { head :ok }
      end
    end
  end
end
