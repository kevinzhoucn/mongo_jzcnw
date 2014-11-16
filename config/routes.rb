Rails3MongoidDevise::Application.routes.draw do
  


  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations"}

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount ChinaCity::Engine => '/china_city'

  get 'home/index'
  get '/publish' => 'home#publish', as: :home_publish
  match '/publish/:type' => 'home#publish', :via => :get, as: :publish
  match '/publish/:type/add' => 'home#add', :via => :get, :as => :home_publish_add
  match '/add/resumes' => 'home#publishresumes', via: :get, as: :publish_resumes
  match '/records/create' => 'home#create', :via => :post, :as => :home_records
  # match '/records/:id' => 'home#show', :via => :get, :as => :record_show
  match '/region/(:province)' => 'home#zizhi', as: :zizhi_province

  match '/categories/(:cat_name)' => 'home#zizhi', :as => :zizhi_daiban
  match '/posts(/:seg_name)(/:cat_name)(/:province)(/:city)' => 'home#zizhi', as: :post_category
  match '/qualification(/:type)(/:seg_name)(/:cat_name)(/:province)(/:city)' => 'home#qualify', as: :home_qualify
  # scope '(home)' do
  #   controller :home do
  #     get '/' => :index

  #     get '/publish', :action => 'publish', :as => :home_publish
  #     match '/zizhi/daiban/(:cat_name)', :action => 'zizhi', :as => :zizhi_daiban
  #     match '/zizhi/zhuanrang', :action => 'zizhi'
  #     match '/zizhi/guakao', :action => 'zizhi'
  #     # match '/zizhi/lt/(:province)', action: 'zizhi', as: :zizhi_province
  #   end
  # end

  resources :resumes, only: [:show, :create, :new, :update]
  resources :records, only: [:show, :favorite, :unfavorite] do
    member do
      post :favorite
      delete :unfavorite
    end
    resources :replies
  end

  resources :qualifies, only: [:show, :create, :new] do
    resources :replies
  end

  # resources :replies

  #get "profile/index"
  match '/profiles/:id' => 'profiles#show', via: :get, as: :profile_show

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
