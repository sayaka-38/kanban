class TopController < ApplicationController

  def index
    @lists = List.where(user: current_user).order("created_at ASC")
    #@lists（複数あるので複数形）の中に、ログインしているユーザーのレコードを取得。
    #かつ、.orderで日付順に並び替えをしている
  end
  
end
