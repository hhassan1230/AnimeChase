Rails.application.routes.draw do
  
  resources:animes
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # get "/auth/:provider" 
  # You can have the root of your site routed with "root"
   root :to => 'animes#search'
   get 'genres/:genre' => 'animes#animes_in_genre'
   get '/anime/:anime' => 'animes#create'
   get '/add_to_watch_list/:save_this_anime' => 'animes#add_to_watch_list'
   get '/random' => 'animes#random'
   get '/watchlist' => 'animes#watchlist'
   get '/top-animes' => 'animes#top_animes'
   get '/date' => 'animes#date_find'
   #Deleting an anime from the watchlist
   post '/watchlist' => 'animes#destroy'

   #this catches the provider's callback and sends us to the sessions
   #controller, create method

   get "/auth/facebook/callback", :to => 'sessions#create'
   get "/signout", :to => 'sessions#destroy'


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
