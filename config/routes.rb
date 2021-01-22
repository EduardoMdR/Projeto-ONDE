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

  # Categorias (category)
  scope 'categorias' do
    get '/new', to: 'categories#new', as: :new_category
    post '/new', to: 'categories#create'
    get '/:id/edit', to: 'categories#edit', as: :edit_category
    patch '/:id/edit', to: 'categories#update'
    get '/:id', to: 'categories#show', as: :show_category
    delete '/:id', to: 'categories#destroy', as: :delete_category
    get '/', to: 'categories#index', as: :categories
  end

  # Sub Categoria (subcategory)
  scope 'sub_categorias' do
    get '/new', to: 'subcategories#new', as: :new_subcategory
    post '/new', to: 'subcategories#create'
    get '/:id/edit', to: 'subcategories#edit', as: :edit_subcategory
    patch '/:id/edit', to: 'subcategories#update'
    get '/:id', to: 'subcategories#show', as: :show_subcategory
    delete '/:id', to: 'subcategories#destroy', as: :delete_subcategory
  end

  # Empresa (company)
  scope 'empresas' do
    get '/new', to: 'companies#new', as: :new_company
    post '/new', to: 'companies#create'
    get '/:id/edit', to: 'companies#edit', as: :edit_company
    patch '/:id/edit', to: 'companies#update'
    get '/:id', to: 'companies#show', as: :show_company
    delete '/:id', to: 'companies#destroy', as: :delete_company
    get '/', to: 'companies#index', as: :companies
  end

  # Review (review)
  # scope 'reviews' do
  #   get '/new', to: 'reviews#new', as: :new_review
  #   post '/new', to: 'reviews#create'
  #   get '/:id/edit', to: 'reviews#edit', as: :edit_review
  #   patch '/:id/edit', to: 'reviews#update'
  #   delete '/:id', to: 'reviews#destroy', as: :delete_review
  # end
  resources :reviews

  # Cupon (coupon)
  scope 'cupons' do
    get '/new', to: 'coupons#new', as: :new_coupon
    post '/new', to: 'coupons#create'
    get '/:id/edit', to: 'coupons#edit', as: :edit_coupon
    patch '/:id/edit', to: 'coupons#update'
    delete '/:id', to: 'coupons#destroy', as: :delete_coupon
    get '/', to: 'coupons#index', as: :coupons
  end

  # Oferta (offer)
  scope 'offers' do
    get '/new', to: 'offers#new', as: :new_offer
    post '/new', to: 'offers#create'
    get '/:id/edit', to: 'offers#edit', as: :edit_offer
    patch '/:id/edit', to: 'offers#update'
    get '/:id', to: 'offers#show', as: :show_offer
    delete '/:id', to: 'offers#destroy', as: :delete_offer
    get '/', to: 'offers#index', as: :offers
  end

  resources :review_offers
  resources :tags

end
