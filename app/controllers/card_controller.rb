class CardController < ApplicationController

  def new
    @card = Card.new #空のcardインスタンスの箱を作成
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def show
    @card = Card.find_by(id: params[:id])
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
    end
    #cardの箱のtitleとmemoとlist_idを変更できるように許可
end