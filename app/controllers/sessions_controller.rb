class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier (email)
    @user_entered_email = params["email"]
    @user_entered_password = params["password"]

    @user_table = User.all
    @user_row = @user_table.find_by("email"=> @user_entered_email)

    if @user_row != nil
      @user_email = @user_row["email"]
      @user_password = @user_row["password"]

      if BCrypt::Password.new(@user_password) == @user_entered_password
        flash["notice"] = "Welcome."
        redirect_to "/companies"
      else  
        redirect_to "/login"
      end  
    
    else
      redirect_to "/login"
    end
    #si es que el email que ingreso el usuario no estaba en la tabla va a traer NIL, porque
    #no encontro coincidencia, caso contrario va traer el email del usuario. Lo mismo para el
    #password


    # 2. if the user exists -> check if they know their password, en otras palabras si ingresaron
    #el password correcto de su cuenta.
    


    
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
