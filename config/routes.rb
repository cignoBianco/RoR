Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    get "/deseases", to: "deseases#index"

    get "/desease-symptoms/:id", to: "symptoms#get_symptoms"

    resources :deseases
    resources :symptoms

end
