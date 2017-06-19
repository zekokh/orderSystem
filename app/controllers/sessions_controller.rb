class SessionsController < ApplicationController

  def new
    render json: { status: "ok", error: "Ошибка"}.to_json
  end

  def create
    if params[:login] && params[:password]
      user = User.find_by(login: params[:login])
      if user && user.password == params[:password]
        token = user.id+"."+Date.now.to_time.to_i
        json = { status: "200", token: token }.to_json
      else
        json = { status: "400", error: "Ошибка аутентификации"}.to_json
      end
    else
      json = { status: "400", error: "Ошибка c параметрами", details: params[:login] }.to_json
    end

    render json: json
  end

  def destroy

  end
end
