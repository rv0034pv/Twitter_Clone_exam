Rails.application.routes.draw do
  get "/" => "posts#top"
  resources :posts do
    collection do
      post :confirm
    end
  end
end
