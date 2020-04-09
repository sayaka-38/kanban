class ListController < ApplicationController
  before_action :set_list, only: %i(edit update)
  #editとupdateで最初にset_listを実行

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

  def edit
  end

  def update
    if @list.update_attributes(list_params) 
      #もしタイトルをアップデート（更新と保存）できたら
      redirect_to :root #リダイレクト
    else #できなかったら
      render action: :edit #編集ページへ戻る
    end
  end

  private
    def list_params #list_paramsの中身
      params.require(:list).permit(:title).merge(user: current_user)
      #listテーブルのカラムの、titleのカラムデータだけを受け取り、titleにcurrent_userを紐付ける
    end

    def set_list
      @list = List.find_by(id: params[:id])
    end

end
