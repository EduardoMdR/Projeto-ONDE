Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#homepage"

  scope 'test' do
    get 'categorias', to: "tests#categorias", as: :categorias
    get 'cupons', to: "tests#cupons", as: :cupons
    get 'ofertas', to: "tests#ofertas", as: :ofertas
    get 'contato', to: "tests#contato", as: :contato
    get 'parceiros', to: "tests#parceiros", as: :parceiros
    get 'empresas', to: "tests#empresas", as: :empresas
    get 'pesquisa', to: "tests#pesquisa", as: :pesquisa
    get 'ofertasdestaque', to: "tests#ofertasdestaque", as: :ofertasdestaque

    # admin
    get 'homeempresa', to: "tests#homeempresa", as: :homeempresa
    get 'todasofertas', to: "tests#todasofertas", as: :todasofertas
    get 'todoscupons', to: "tests#todoscupons", as: :todoscupons
    get 'criaroferta', to: "tests#criaroferta", as: :criaroferta 
    get 'criarcupom', to: "tests#criarcupom", as: :criarcupom
    get 'editaroferta', to: "tests#editaroferta", as: :editaroferta
    get 'editarcupom', to: "tests#editarcupom", as: :editarcupom
    # get 'review', to: "tests#review", as: :review
    get 'dashboard', to: "tests#dashboard", as: :dashboard
    get 'editardados', to: "tests#editardados", as: :editardados
    get 'hover', to: "tests#hover", as: :hover
  end

  scope 'users' do
    get 'index', to: 'users#index', as: :user_index
    get 'novo_usuario', to: 'users#new', as: :new_user
    post 'novo_usuario', to: 'users#create'
    get '/:id/activate', to: 'users#activate', as: :activate
  end

  scope 'auth' do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
  end

  scope 'categories' do
    get '/new', to: 'categories#new', as: :new_category
    post '/new', to: 'categories#create'
    get '/:id/edit', to: 'categories#edit', as: :edit_category
    patch '/:id/edit', to: 'categories#update'
    get '/:id', to: 'categories#show', as: :show_category
    delete '/:id', to: 'categories#destroy', as: :delete_category
    get '/', to: 'categories#index', as: :categories
  end

  resources :subcategories

  resources :companies
  resources :reviews
  resources :coupons
  resources :offers
  resources :review_offers
  resources :tags

end
