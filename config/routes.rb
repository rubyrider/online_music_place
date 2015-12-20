Rails.application.routes.draw do
  devise_for :users, :controllers => {
      :registrations      => "registrations",
      :sessions           => "sessions",
      omniauth_callbacks: 'omniauth_callbacks'
  }

  resources :users do
    member do
      get :profile
      get :play_lists
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
  get '/genres/:id', to: 'music#index'
  get '/languages/:id', to: 'music#index'
  get '/songs/:id', to: 'music#index'
  get '/playlists/:id', to: 'music#index'
  get '/category/:id/songs', to: 'music#index'
  get '/search', to: 'music#index'
  get '/artists/:id', to: 'music#index'
  get '/profile/:id', to: 'music#index'
  get '/users/:id/finish_signup' => 'users#finish_signup', :as => :finish_signup
  patch '/users/:id/finish_signup' => 'users#finish_signup'


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
  # Example resource route within a namespace:
  namespace :api do
    namespace :v1 do
      resources :genres, only: [:show]
      resources :languages, only: [:show]

      resources :users do
        member do
          get :favorite_songs
          get :favorite_albums
          get :favorite_play_lists
          get :favorite_artists
        end
        resources :play_lists do
          member do
            post :toggle_like
          end
          collection do
            post :toggle_presence_in_play_list
          end
        end
        resources :songs, only: [:index] do
          member do
            get :play_song
            post :toggle_like
          end
          resources :play_lists do
            collection do
              post :toggle_like
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
          get :get_for_jplayer
        end
      end
      resources :artists do
        member do
          get :get_for_jplayer
        end
      end
      resources :play_lists do
        member do
          get :songs
          get :get_for_jplayer
        end
        collection do
          get :featured
          get :surprise_me
        end
      end
    end
  end
  namespace :backend do
    root 'songs#index'
    resources :users
    resources :songs do
      get :song_queries, on: :collection
      get :autocomplete_category_name, :on => :collection
      get :autocomplete_artist_name, :on => :collection
      get :autocomplete_album_name, :on => :collection
    end
    resources :tracks
    resources :albums do
      get :album_queries, on: :collection
      get :autocomplete_category_name, :on => :collection
      get :autocomplete_artist_name, :on => :collection
    end
    resources :artists do
      get :artist_queries, on: :collection
      get :autocomplete_musical_band_name, :on => :collection
    end
    resources :categories do
      get :category_queries, on: :collection
    end
    resources :subscriptions
    resources :languages do
      get :language_queries, on: :collection
    end
    resources :analytics
    resources :ad_positions
    resources :advertisements
    resources :play_lists do
      get :autocomplete_song_name, :on => :collection
    end
    resources :musical_bands
  end
end
