Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  resources :users do
    member do
      get :profile
      get 'edit-profile' => :edit_profile
      patch :update
    end
  end

  root to: 'music#index'
  get '/home', to: 'music#index'
  get '/albums', to: 'music#index'
  get '/albums/:id', to: 'music#index'
  get '/artists/', to: 'music#index'
  get '/artists/:id', to: 'music#index'
  get '/artist/:id', to: 'music#index'
  get '/profile/:id', to: 'music#index'

  namespace :api do
  namespace :v1 do
    get 'home/index'
    get 'home/search'
    end
  end
  namespace :backend do
  get 'home/index'
  get 'home/search'
  get 'home/autocomplete'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
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
  namespace :api do
    namespace :v1 do
      resources :users do
        member do
          get :favorite_songs
          get :favorite_albums
          get :favorite_play_lists
          get :favorite_artists
        end
        resources :songs, only: [:index] do
          member do
            post :toggle_like
          end
          resources :play_lists do
            collection do
              post :toggle_presence_in_play_list
            end
          end
        end
        resources :albums, only: [:index] do
          member do
            post :toggle_like
          end
        end

        resources :artists, only: [:index] do
          member do
            post :toggle_like
          end
        end
      end
      resources :songs
      resources :albums do
        collection do
          get :new_releases
        end
        member do
          get :songs
        end
      end
      resources :artists
      resources :play_lists do
        member do
          get :songs
        end
        collection do
          get :featured
          get :surprise_me
        end
      end
    end
  end
  namespace :backend do
    resources :users
    resources :songs do
      get :autocomplete_category_name, :on => :collection
      get :autocomplete_artist_name, :on => :collection
      get :autocomplete_album_name, :on => :collection
    end
    resources :tracks
    resources :albums do
      get :autocomplete_category_name, :on => :collection
      get :autocomplete_artist_name, :on => :collection
    end
    resources :artists do
      get :autocomplete_musical_band_name, :on => :collection
    end
    resources :categories
    resources :subscriptions
    resources :languages
    resources :analytics
    resources :ad_positions
    resources :advertisements
    resources :play_lists do
    	get :autocomplete_song_name, :on => :collection
    end
    resources :musical_bands
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
  end
end
