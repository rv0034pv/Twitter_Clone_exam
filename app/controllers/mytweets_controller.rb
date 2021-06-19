class MytweetsController < ApplicationController
  before_action :set_mytweet, only: [:show, :edit, :update, :destroy]
  def new
    @mytweet = Mytweet.new
  end

  def create
    @mytweet = Mytweet.new(mytweet_params)
    if params[:back]
      render :new
    else
     if @mytweet.save
       redirect_to mytweets_path, notice: "ツイートに成功しました！"
     else
       render :new
     end
   end
  end

  def confirm
    @mytweet = Mytweet.new(mytweet_params)
    render :new if @mytweet.invalid?
  end

  def edit
    @mytweet = Mytweet.find(params[:id])
  end

  def update
    @mytweet = Mytweet.find(params[:id])
    if @mytweet.update(mytweet_params)
      redirect_to mytweets_path, notice: "tweetを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @mytweet.destroy
    redirect_to mytweets_path, notice:"tweetを削除しました！"
  end

  def index
    @mytweets = Mytweet.all
  end

  def show
  @mytweet = Mytweet.find(params[:id])
  end

  def top
  end

  private
  def mytweet_params
    params.require(:mytweet).permit(:content)
  end

  def set_mytweet
    @mytweet = Mytweet.find(params[:id])
  end
end
