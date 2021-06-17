class MytweetsController < ApplicationController
  def new
    @mytweet = Mytweet.new
  end

  def create
    @mytweet = Mytweet.create(mytweet_params)
    if @mytweet.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to mytweets_path, notice: "ツイートに成功しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end

  def edit
    @mytweet = Mytweet.find(params[:id])
  end

  def update
    @mytweet = Mytweet.find(params[:id])
    if @mytweet.update(mytweet_params)
      redirect_to mytweets_path, notice: "ブログを編集しました！"
    else
      render :edit
    end

  end

  def index
    @mytweets = Mytweet.all
  end

  def show
  @mytweet = Mytweet.find(params[:id])
  end

  private
  def mytweet_params
    params.require(:mytweet).permit(:content)
  end
end
