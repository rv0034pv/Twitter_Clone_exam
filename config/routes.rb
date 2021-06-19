Rails.application.routes.draw do
  get "/" => "mytweet#top"
  resources :mytweets do
    collection do
      post :confirm
    end
  end
end
