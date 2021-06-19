Rails.application.routes.draw do
  resources :mytweets do
    collection do
      post :confirm
    end
  end
  get "/" => "mytweets#top"
end
