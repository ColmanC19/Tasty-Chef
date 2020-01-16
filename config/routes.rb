Rails.application.routes.draw do

  resources :recipes do
    resources :tags
  end

  resources :tags do
    resources :recipes
  end

end
