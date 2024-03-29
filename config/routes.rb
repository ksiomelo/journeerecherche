Journeerecherche::Application.routes.draw do

  
  resources :areas
  resources :app_settings


  resources :inscriptions do
    member do
      get 'success'
      get 'add_to_favorites'
      get 'remove_from_favorites'
    end
    collection do
      get 'favorites'
    end
  end

  devise_for :users
  
  match 'doctorants' => 'inscriptions#new'
  match 'entreprises' => 'users#sign_up'
  
  #match 'admin/app_settings' => 'admins#moderate_inscriptions'
  #match 'admin/inscriptions/:id/approve' => 'admins#approve_inscription'
  
  namespace :admin do
    resources :inscriptions do
      member do
        get 'approve'
      end
      collection do
        get 'to_moderate'
        get 'stats'
        get 'app_settings'
      end
    end
     resources :users do
      member do
        get 'approve'
        get 'display'
        get 'print'
      end
      collection do
        get 'to_moderate'
      end
    end
    resources :lists do
      collection do
        get 'presenters'
        get 'enterprises'
        get 'badges'
      end
    end
    
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
  root :to => "base#index"
end
