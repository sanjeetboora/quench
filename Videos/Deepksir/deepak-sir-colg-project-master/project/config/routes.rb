Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  get 'home/index'
  get 'home/about_institute'
  get 'home/about_irdindia'
  get 'home/about_universal_innovators'
  get 'home/call_for_papers'
  get 'home/registration'
  get 'home/steeringcommittee'
  get 'home/technicalprogramcommittee'
  get 'home/advisorycommittee'
  get 'home/sponsorship'
  get 'home/publication'
  get 'home/contact_us'
  post 'home/contact_us/post' => 'home#contact_us_post'
  get 'home/special_submission'
  post 'home/special_submission/post' => 'home#special_submission_post'
  get 'home/paper_submission'
  get 'home/download_paper_template'

  get 'home/conference_venue'
  get 'home/important_dates'




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
