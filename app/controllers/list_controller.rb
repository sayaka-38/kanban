class ListController < ApplicationController

  def new
    @list = List.new #空のListテーブルの箱ができる
  end

  def create
    @list = List.new(list_params) #Listテーブルの箱にlist_paramsの値を持ってくる
    if @list.save #Listデータをデータベースに保存
      redirect_to :root #できたらリダイレクト
    else #できなかったら
      render action: :new #リスト作成ページにもどる
    end
  end

  private
    def list_params #list_paramsの中身
      params.require(:list).permit(:title).merge(user: current_user)
      #listテーブルのカラムの、titleのカラムデータだけを受け取り、titleにcurrent_userを紐付ける
    end

end
