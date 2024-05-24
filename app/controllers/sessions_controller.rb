class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user

    # 1. Captura el username y el password que ingreso el usuario al momento de loguearse.

    #2. Anda al database, a la table users y determina si es que ese usuario existe comparando
    #   email que ingreso con los de la tabla, con find_by.
    
    #3. Si es que el email que ingreso si estaba en la tabla (ES DECIR EL RESULTADO DEL FIND_BY
    # es diferente a nil (nil es vacio, si es que el email que puso no coincidia con ninguno en la
    # tabla), entonces pregunta si es que el password de ese usuario que esta encryptado en la base
    # de datos es = al password que acaba de ingresar el usuario. (IMPORTANTISISISISISIMO, esa
    # pregunta se hacce con: BCrypt::Password.new(@user_password) == @user_entered_password). En
    # caso si coincida que le diga Welcome y vaya al link "/companies", casos contrarios, que 
    # vaya al link "/login" nuevamente, por lo tanto, no dejandolos entrar.

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

    


    
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
