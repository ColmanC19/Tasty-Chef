Rails.application.routes.draw do
  resources :recipes do
    resources :tags
  end
end
