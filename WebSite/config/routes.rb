Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#homepage"

  scope 'test' do
    get 'categorias', to: "tests#categorias", as: :categorias
  end
end
