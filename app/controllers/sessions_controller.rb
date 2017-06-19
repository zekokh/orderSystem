class SessionsController < ApplicationController

  def new
    json = { status: token, error: "Ошибка"}.to_json
    render json: json
  end

  def create
    user = User.find_by(login: params[:login])
    if user && user.password == params[:password]
      token = user.id+"."+Date.now.to_time.to_i
      json = { status: "200", token: token }.to_json
    else
      json = { status: "400", error: "Ошибка"}.to_json
    end
    render json
  end

  def destroy

  end
end
