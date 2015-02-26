Rails.application.routes.draw do

  get 'employee/index'
  get 'employees' => 'employees#login', as: 'employee_login'
  get 'employee/logout'
  get 'employee/accept_a_job'
  get 'employee/submit_a_completed_job'
  get 'employee/account_details'

  get 'placeanorder' => 'account#place_an_order', as: 'place_an_order'

  post 'create_order' => 'account#create_order', as: 'create_order'

  get 'pastorders' => 'account#past_orders', as: 'past_orders'

  get 'pendingorders' => 'account#pending_orders', as: 'pending_orders'

  get 'accountdetails' => 'account#account_details', as: 'account_details'
  get 'accountdetails/paymentdetails' => 'account#payment_details', as: 'payment_details'

  get 'dashboard' => 'account#index', as: 'user_index'

  post 'account/create', as: 'create_account'
  post 'account/update', as: 'update_user'
  post 'account/create_or_update_stripe_token', as: 'update_stripe_token'

  get 'about' => 'home#about'

  post 'sessions/create', as: 'create_session'

  get 'signup' => 'home#signup', as: 'signup'

  get 'login' => 'home#login', as: 'login'

  get 'logout' => 'sessions#delete', as: 'logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
