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
