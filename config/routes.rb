Parrainage::Application.routes.draw do

  get "informations", to: "static#infos", as: 'infos'
  get "barcodes", to: "static#barcodes", as: 'barcodes'
  get "admins", to: "static#admins", as: 'admins'
  get "manips/verif/:id", to: "manips#verif", as: 'verif_manip'
  get "manips/verifx/:id", to: "manips#verifx", as: 'verifx_manip'
  get "onscrits/apprendre", to: "onscrits#learnonscrits", as: 'learn_onscrits'
  get "onscrits/apprendre_reverse", to: "onscrits#learnonscritsreverse", as: 'learnreverse_onscrits'
  get "connexion", to: "pgs#beforelogin", as: 'beforelogin'
  get "deconnexion", to: "pgs#logout", as: 'logout'
  get "sondages/:id/review", to: "sondages#review", as: 'review_sondage'
  get "pgs/punchlines", to: "pgs#punchlines", as: 'punchlines'

  post "pgs/login", to: "pgs#login", as: 'login'
  post "pgs/check", to: "pgs#check", as: 'check_pg'
  post "pgs/checkforverifx", to: "pgs#checkforverifx", as: 'checkforverifx_pg'
  post "pgs/uncheckforverifx", to: "pgs#uncheckforverifx", as: 'uncheckforverifx_pg'
  post "setadmin", to: "static#set_admin", as: 'set_admin'
  post "sondage/:sondage_id/vote", to: "sondages#vote", as: 'vote'
  
  resources :semaines

  resources :sondages

  resources :onscrits

  resources :manips

  resources :bouls

  resources :prepas

  resources :pgs

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static#home'

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
