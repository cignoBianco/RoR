Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    get "/deseases", to: "deseases#index"

    get "/desease-symptoms/:id", to: "symptoms#get_symptoms"
    post "/desease-symptoms/:id", to:"deseases#add_symptoms"

    resources :deseases
    resources :symptoms
    resources :symptoms_of_deseases

end
