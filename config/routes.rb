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
    get 'empresa', to: "tests#empresa", as: :empresa
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
    get 'review', to: "tests#review", as: :review_test
    get 'dashboard', to: "tests#dashboard", as: :dashboard
    get 'editardados', to: "tests#editardados", as: :editardados
    get 'hover', to: "tests#hover", as: :hover
  end

  scope 'usuarios' do
    get '/', to: 'users#index', as: :user_index
    get 'novo_usuario', to: 'users#new', as: :new_user
    post 'novo_usuario', to: 'users#create'
    get '/:id/edit', to: 'users#edit', as: :edit_user
    patch '/:id/edit', to: 'users#update'
    delete '/:id', to: 'users#destroy', as: :delete_user
    get '/:id', to: 'users#show', as: :show_user
    get ':id/enderecos', to: 'users#show_user_addresses', as: :show_user_addresses
    get ':id/reviews', to: 'users#show_user_reviews', as: :show_user_reviews
    get '/:id/activate', to: 'users#activate', as: :activate
  end

  scope 'admin' do
    get 'empresas', to: 'admins#company_index', as: :admin_company_index
  end

  scope '' do
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
    get ':id/new', to: 'subcategories#new', as: :new_subcategory
    post ':id/new', to: 'subcategories#create'
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
    # get ':id/review', to: 'companies#review', as: :review_company
    get '/:id/dashboard', to: 'companies#dashboard', as: :company_dashboard
    get '/:id/ofertas', to: 'companies#offers_index', as: :company_offers_index
    get '/:id/cupons', to: 'companies#coupons_index', as: :company_coupons_index
  end

  # Review das empresas (review)
  scope 'reviews' do
    get ':id/new', to: 'reviews#new', as: :new_review
    post ':id/new', to: 'reviews#create'
    get '/:id/edit', to: 'reviews#edit', as: :edit_review
    patch '/:id/edit', to: 'reviews#update'
    delete '/:id', to: 'reviews#destroy', as: :delete_review
  end

  # Cupon (coupon)
  scope 'cupons' do
    get ':id/new', to: 'coupons#new', as: :new_coupon
    post ':id/new', to: 'coupons#create'
    get '/:id/edit', to: 'coupons#edit', as: :edit_coupon
    patch '/:id/edit', to: 'coupons#update'
    delete '/:id', to: 'coupons#destroy', as: :delete_coupon
    get '/', to: 'coupons#index', as: :coupons
  end

  # Oferta (offer)
  scope 'ofertas' do
    get ':id/new', to: 'offers#new', as: :new_offer
    post ':id/new', to: 'offers#create'
    get '/:id/edit', to: 'offers#edit', as: :edit_offer
    patch '/:id/edit', to: 'offers#update'
    get '/:id', to: 'offers#show', as: :show_offer
    delete '/:id', to: 'offers#destroy', as: :delete_offer
    get '/', to: 'offers#index', as: :offers
  end

  # Review das ofertas (review_offer)
  scope 'review-ofertas' do
    get ':id/new', to: 'review_offers#new', as: :new_review_offer
    post ':id/new', to: 'review_offers#create'
    get '/:id/edit', to: 'review_offers#edit', as: :edit_review_offer
    patch '/:id/edit', to: 'review_offers#update'
    delete '/:id', to: 'review_offers#destroy', as: :delete_review_offer
    get ':id/', to: 'review_offers#index', as: :review_offers
  end

  # Tag (tag)
  scope 'tags' do
    get '/new', to: 'tags#new', as: :new_tag
    post '/new', to: 'tags#create'
    get '/:id/edit', to: 'tags#edit', as: :edit_tag
    patch '/:id/edit', to: 'tags#update'
    get '/:id', to: 'tags#show', as: :show_tag
    delete '/:id', to: 'tags#destroy', as: :delete_tag
    get '/', to: 'tags#index', as: :tags
  end

  # Endereço (address)
  scope 'locais' do
    get 'new', to: 'addresses#new', as: :new_address
    post 'new', to: 'addresses#create'
    get 'edit/:id', to: 'addresses#edit', as: :edit_address
    patch 'edit/:id', to: 'addresses#update'
    delete 'delete/:id', to: 'addresses#destroy', as: :delete_address
  end
end
