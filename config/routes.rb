Rails.application.routes.draw do
  
  root 'home#main'
  
  get 'home/main'
  devise_for :users
  
  
  resources :comments
  
  post '/posts/:id/like' => 'likes#like_toggle', as: 'like_post'
  
  #카페, 지도 화면 보여주기
  get '/posts' => 'posts#index'
  
  #상세정보 페이지
  get '/posts/:id/info' => 'posts#show'
  
  get '/posts/index' 
  
  
  # 처음 검색눌렀을 때 카페, 지도 화면 보여주기
  post '/posts/index' => 'posts#index'
  
  # 평가하는거 반영
  #post '/posts/:id' => 'posts#update'
  
  # 필터 기능
  get '/posts/content/filter' => 'posts#filter'
  
  get '/home/login'


  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root geof your site routed with "root"
  # root 'welcome#index'

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
