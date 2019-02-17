Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }
  resources :users
  resources :products
  resources :categories

  post 'categories/:id/upload_image', to: "categories#upload_image", as: :upload_category_image
  post 'products/:id/upload_images', to: "products#upload_images", as: :upload_product_images
end
