# == Route Map
#
#                                                  Prefix Verb       URI Pattern                                                                                 Controller#Action
#                                      backend_home_index GET        /backend/home/index(.:format)                                                               backend/home#index
#                                     backend_home_search GET        /backend/home/search(.:format)                                                              backend/home#search
#                               backend_home_autocomplete GET        /backend/home/autocomplete(.:format)                                                        backend/home#autocomplete
#                                  new_admin_user_session GET        /admin/login(.:format)                                                                      active_admin/devise/sessions#new
#                                      admin_user_session POST       /admin/login(.:format)                                                                      active_admin/devise/sessions#create
#                              destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                     active_admin/devise/sessions#destroy
#                                     admin_user_password POST       /admin/password(.:format)                                                                   active_admin/devise/passwords#create
#                                 new_admin_user_password GET        /admin/password/new(.:format)                                                               active_admin/devise/passwords#new
#                                edit_admin_user_password GET        /admin/password/edit(.:format)                                                              active_admin/devise/passwords#edit
#                                                         PATCH      /admin/password(.:format)                                                                   active_admin/devise/passwords#update
#                                                         PUT        /admin/password(.:format)                                                                   active_admin/devise/passwords#update
#                                              admin_root GET        /admin(.:format)                                                                            admin/dashboard#index
#                          batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                   admin/admin_users#batch_action
#                                       admin_admin_users GET        /admin/admin_users(.:format)                                                                admin/admin_users#index
#                                                         POST       /admin/admin_users(.:format)                                                                admin/admin_users#create
#                                    new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                            admin/admin_users#new
#                                   edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                       admin/admin_users#edit
#                                        admin_admin_user GET        /admin/admin_users/:id(.:format)                                                            admin/admin_users#show
#                                                         PATCH      /admin/admin_users/:id(.:format)                                                            admin/admin_users#update
#                                                         PUT        /admin/admin_users/:id(.:format)                                                            admin/admin_users#update
#                                                         DELETE     /admin/admin_users/:id(.:format)                                                            admin/admin_users#destroy
#                                         admin_dashboard GET        /admin/dashboard(.:format)                                                                  admin/dashboard#index
#                                batch_action_admin_users POST       /admin/users/batch_action(.:format)                                                         admin/users#batch_action
#                                             admin_users GET        /admin/users(.:format)                                                                      admin/users#index
#                                                         POST       /admin/users(.:format)                                                                      admin/users#create
#                                          new_admin_user GET        /admin/users/new(.:format)                                                                  admin/users#new
#                                         edit_admin_user GET        /admin/users/:id/edit(.:format)                                                             admin/users#edit
#                                              admin_user GET        /admin/users/:id(.:format)                                                                  admin/users#show
#                                                         PATCH      /admin/users/:id(.:format)                                                                  admin/users#update
#                                                         PUT        /admin/users/:id(.:format)                                                                  admin/users#update
#                                                         DELETE     /admin/users/:id(.:format)                                                                  admin/users#destroy
#                        batch_action_admin_musical_bands POST       /admin/musical_bands/batch_action(.:format)                                                 admin/musical_bands#batch_action
#                                     admin_musical_bands GET        /admin/musical_bands(.:format)                                                              admin/musical_bands#index
#                                                         POST       /admin/musical_bands(.:format)                                                              admin/musical_bands#create
#                                  new_admin_musical_band GET        /admin/musical_bands/new(.:format)                                                          admin/musical_bands#new
#                                 edit_admin_musical_band GET        /admin/musical_bands/:id/edit(.:format)                                                     admin/musical_bands#edit
#                                      admin_musical_band GET        /admin/musical_bands/:id(.:format)                                                          admin/musical_bands#show
#                                                         PATCH      /admin/musical_bands/:id(.:format)                                                          admin/musical_bands#update
#                                                         PUT        /admin/musical_bands/:id(.:format)                                                          admin/musical_bands#update
#                                                         DELETE     /admin/musical_bands/:id(.:format)                                                          admin/musical_bands#destroy
#                              batch_action_admin_artists POST       /admin/artists/batch_action(.:format)                                                       admin/artists#batch_action
#                                           admin_artists GET        /admin/artists(.:format)                                                                    admin/artists#index
#                                                         POST       /admin/artists(.:format)                                                                    admin/artists#create
#                                        new_admin_artist GET        /admin/artists/new(.:format)                                                                admin/artists#new
#                                       edit_admin_artist GET        /admin/artists/:id/edit(.:format)                                                           admin/artists#edit
#                                            admin_artist GET        /admin/artists/:id(.:format)                                                                admin/artists#show
#                                                         PATCH      /admin/artists/:id(.:format)                                                                admin/artists#update
#                                                         PUT        /admin/artists/:id(.:format)                                                                admin/artists#update
#                                                         DELETE     /admin/artists/:id(.:format)                                                                admin/artists#destroy
#                            batch_action_admin_companies POST       /admin/companies/batch_action(.:format)                                                     admin/companies#batch_action
#                                         admin_companies GET        /admin/companies(.:format)                                                                  admin/companies#index
#                                                         POST       /admin/companies(.:format)                                                                  admin/companies#create
#                                       new_admin_company GET        /admin/companies/new(.:format)                                                              admin/companies#new
#                                      edit_admin_company GET        /admin/companies/:id/edit(.:format)                                                         admin/companies#edit
#                                           admin_company GET        /admin/companies/:id(.:format)                                                              admin/companies#show
#                                                         PATCH      /admin/companies/:id(.:format)                                                              admin/companies#update
#                                                         PUT        /admin/companies/:id(.:format)                                                              admin/companies#update
#                                                         DELETE     /admin/companies/:id(.:format)                                                              admin/companies#destroy
#                               batch_action_admin_albums POST       /admin/albums/batch_action(.:format)                                                        admin/albums#batch_action
#                                            admin_albums GET        /admin/albums(.:format)                                                                     admin/albums#index
#                                                         POST       /admin/albums(.:format)                                                                     admin/albums#create
#                                         new_admin_album GET        /admin/albums/new(.:format)                                                                 admin/albums#new
#                                        edit_admin_album GET        /admin/albums/:id/edit(.:format)                                                            admin/albums#edit
#                                             admin_album GET        /admin/albums/:id(.:format)                                                                 admin/albums#show
#                                                         PATCH      /admin/albums/:id(.:format)                                                                 admin/albums#update
#                                                         PUT        /admin/albums/:id(.:format)                                                                 admin/albums#update
#                                                         DELETE     /admin/albums/:id(.:format)                                                                 admin/albums#destroy
#                                batch_action_admin_songs POST       /admin/songs/batch_action(.:format)                                                         admin/songs#batch_action
#                                             admin_songs GET        /admin/songs(.:format)                                                                      admin/songs#index
#                                                         POST       /admin/songs(.:format)                                                                      admin/songs#create
#                                          new_admin_song GET        /admin/songs/new(.:format)                                                                  admin/songs#new
#                                         edit_admin_song GET        /admin/songs/:id/edit(.:format)                                                             admin/songs#edit
#                                              admin_song GET        /admin/songs/:id(.:format)                                                                  admin/songs#show
#                                                         PATCH      /admin/songs/:id(.:format)                                                                  admin/songs#update
#                                                         PUT        /admin/songs/:id(.:format)                                                                  admin/songs#update
#                                                         DELETE     /admin/songs/:id(.:format)                                                                  admin/songs#destroy
#                        batch_action_admin_subscriptions POST       /admin/subscriptions/batch_action(.:format)                                                 admin/subscriptions#batch_action
#                                     admin_subscriptions GET        /admin/subscriptions(.:format)                                                              admin/subscriptions#index
#                                                         POST       /admin/subscriptions(.:format)                                                              admin/subscriptions#create
#                                  new_admin_subscription GET        /admin/subscriptions/new(.:format)                                                          admin/subscriptions#new
#                                 edit_admin_subscription GET        /admin/subscriptions/:id/edit(.:format)                                                     admin/subscriptions#edit
#                                      admin_subscription GET        /admin/subscriptions/:id(.:format)                                                          admin/subscriptions#show
#                                                         PATCH      /admin/subscriptions/:id(.:format)                                                          admin/subscriptions#update
#                                                         PUT        /admin/subscriptions/:id(.:format)                                                          admin/subscriptions#update
#                                                         DELETE     /admin/subscriptions/:id(.:format)                                                          admin/subscriptions#destroy
#                               batch_action_admin_tracks POST       /admin/tracks/batch_action(.:format)                                                        admin/tracks#batch_action
#                                            admin_tracks GET        /admin/tracks(.:format)                                                                     admin/tracks#index
#                                                         POST       /admin/tracks(.:format)                                                                     admin/tracks#create
#                                         new_admin_track GET        /admin/tracks/new(.:format)                                                                 admin/tracks#new
#                                        edit_admin_track GET        /admin/tracks/:id/edit(.:format)                                                            admin/tracks#edit
#                                             admin_track GET        /admin/tracks/:id(.:format)                                                                 admin/tracks#show
#                                                         PATCH      /admin/tracks/:id(.:format)                                                                 admin/tracks#update
#                                                         PUT        /admin/tracks/:id(.:format)                                                                 admin/tracks#update
#                                                         DELETE     /admin/tracks/:id(.:format)                                                                 admin/tracks#destroy
#                           batch_action_admin_categories POST       /admin/categories/batch_action(.:format)                                                    admin/categories#batch_action
#                                        admin_categories GET        /admin/categories(.:format)                                                                 admin/categories#index
#                                                         POST       /admin/categories(.:format)                                                                 admin/categories#create
#                                      new_admin_category GET        /admin/categories/new(.:format)                                                             admin/categories#new
#                                     edit_admin_category GET        /admin/categories/:id/edit(.:format)                                                        admin/categories#edit
#                                          admin_category GET        /admin/categories/:id(.:format)                                                             admin/categories#show
#                                                         PATCH      /admin/categories/:id(.:format)                                                             admin/categories#update
#                                                         PUT        /admin/categories/:id(.:format)                                                             admin/categories#update
#                                                         DELETE     /admin/categories/:id(.:format)                                                             admin/categories#destroy
#                                          admin_comments GET        /admin/comments(.:format)                                                                   admin/comments#index
#                                                         POST       /admin/comments(.:format)                                                                   admin/comments#create
#                                           admin_comment GET        /admin/comments/:id(.:format)                                                               admin/comments#show
#                                                         DELETE     /admin/comments/:id(.:format)                                                               admin/comments#destroy
#                                        new_user_session GET        /users/sign_in(.:format)                                                                    sessions#new
#                                            user_session POST       /users/sign_in(.:format)                                                                    sessions#create
#                                    destroy_user_session DELETE     /users/sign_out(.:format)                                                                   sessions#destroy
#                                           user_password POST       /users/password(.:format)                                                                   devise/passwords#create
#                                       new_user_password GET        /users/password/new(.:format)                                                               devise/passwords#new
#                                      edit_user_password GET        /users/password/edit(.:format)                                                              devise/passwords#edit
#                                                         PATCH      /users/password(.:format)                                                                   devise/passwords#update
#                                                         PUT        /users/password(.:format)                                                                   devise/passwords#update
#                                cancel_user_registration GET        /users/cancel(.:format)                                                                     registrations#cancel
#                                       user_registration POST       /users(.:format)                                                                            registrations#create
#                                   new_user_registration GET        /users/sign_up(.:format)                                                                    registrations#new
#                                  edit_user_registration GET        /users/edit(.:format)                                                                       registrations#edit
#                                                         PATCH      /users(.:format)                                                                            registrations#update
#                                                         PUT        /users(.:format)                                                                            registrations#update
#                                                         DELETE     /users(.:format)                                                                            registrations#destroy
#                              favorite_songs_api_v1_user GET        /api/v1/users/:id/favorite_songs(.:format)                                                  api/v1/users#favorite_songs
#                             favorite_albums_api_v1_user GET        /api/v1/users/:id/favorite_albums(.:format)                                                 api/v1/users#favorite_albums
#                         favorite_play_lists_api_v1_user GET        /api/v1/users/:id/favorite_play_lists(.:format)                                             api/v1/users#favorite_play_lists
#                            favorite_artists_api_v1_user GET        /api/v1/users/:id/favorite_artists(.:format)                                                api/v1/users#favorite_artists
#                            toggle_like_api_v1_user_song POST       /api/v1/users/:user_id/songs/:id/toggle_like(.:format)                                      api/v1/songs#toggle_like
# toggle_presence_in_play_list_api_v1_user_song_play_list POST       /api/v1/users/:user_id/songs/:song_id/play_lists/:id/toggle_presence_in_play_list(.:format) api/v1/play_lists#toggle_presence_in_play_list
#                             api_v1_user_song_play_lists GET        /api/v1/users/:user_id/songs/:song_id/play_lists(.:format)                                  api/v1/play_lists#index
#                                                         POST       /api/v1/users/:user_id/songs/:song_id/play_lists(.:format)                                  api/v1/play_lists#create
#                          new_api_v1_user_song_play_list GET        /api/v1/users/:user_id/songs/:song_id/play_lists/new(.:format)                              api/v1/play_lists#new
#                         edit_api_v1_user_song_play_list GET        /api/v1/users/:user_id/songs/:song_id/play_lists/:id/edit(.:format)                         api/v1/play_lists#edit
#                              api_v1_user_song_play_list GET        /api/v1/users/:user_id/songs/:song_id/play_lists/:id(.:format)                              api/v1/play_lists#show
#                                                         PATCH      /api/v1/users/:user_id/songs/:song_id/play_lists/:id(.:format)                              api/v1/play_lists#update
#                                                         PUT        /api/v1/users/:user_id/songs/:song_id/play_lists/:id(.:format)                              api/v1/play_lists#update
#                                                         DELETE     /api/v1/users/:user_id/songs/:song_id/play_lists/:id(.:format)                              api/v1/play_lists#destroy
#                                       api_v1_user_songs GET        /api/v1/users/:user_id/songs(.:format)                                                      api/v1/songs#index
#                           toggle_like_api_v1_user_album POST       /api/v1/users/:user_id/albums/:id/toggle_like(.:format)                                     api/v1/albums#toggle_like
#                                      api_v1_user_albums GET        /api/v1/users/:user_id/albums(.:format)                                                     api/v1/albums#index
#                          toggle_like_api_v1_user_artist POST       /api/v1/users/:user_id/artists/:id/toggle_like(.:format)                                    api/v1/artists#toggle_like
#                                     api_v1_user_artists GET        /api/v1/users/:user_id/artists(.:format)                                                    api/v1/artists#index
#                                            api_v1_users GET        /api/v1/users(.:format)                                                                     api/v1/users#index
#                                                         POST       /api/v1/users(.:format)                                                                     api/v1/users#create
#                                         new_api_v1_user GET        /api/v1/users/new(.:format)                                                                 api/v1/users#new
#                                        edit_api_v1_user GET        /api/v1/users/:id/edit(.:format)                                                            api/v1/users#edit
#                                             api_v1_user GET        /api/v1/users/:id(.:format)                                                                 api/v1/users#show
#                                                         PATCH      /api/v1/users/:id(.:format)                                                                 api/v1/users#update
#                                                         PUT        /api/v1/users/:id(.:format)                                                                 api/v1/users#update
#                                                         DELETE     /api/v1/users/:id(.:format)                                                                 api/v1/users#destroy
#                                            api_v1_songs GET        /api/v1/songs(.:format)                                                                     api/v1/songs#index
#                                                         POST       /api/v1/songs(.:format)                                                                     api/v1/songs#create
#                                         new_api_v1_song GET        /api/v1/songs/new(.:format)                                                                 api/v1/songs#new
#                                        edit_api_v1_song GET        /api/v1/songs/:id/edit(.:format)                                                            api/v1/songs#edit
#                                             api_v1_song GET        /api/v1/songs/:id(.:format)                                                                 api/v1/songs#show
#                                                         PATCH      /api/v1/songs/:id(.:format)                                                                 api/v1/songs#update
#                                                         PUT        /api/v1/songs/:id(.:format)                                                                 api/v1/songs#update
#                                                         DELETE     /api/v1/songs/:id(.:format)                                                                 api/v1/songs#destroy
#                              new_releases_api_v1_albums GET        /api/v1/albums/new_releases(.:format)                                                       api/v1/albums#new_releases
#                                      songs_api_v1_album GET        /api/v1/albums/:id/songs(.:format)                                                          api/v1/albums#songs
#                                           api_v1_albums GET        /api/v1/albums(.:format)                                                                    api/v1/albums#index
#                                                         POST       /api/v1/albums(.:format)                                                                    api/v1/albums#create
#                                        new_api_v1_album GET        /api/v1/albums/new(.:format)                                                                api/v1/albums#new
#                                       edit_api_v1_album GET        /api/v1/albums/:id/edit(.:format)                                                           api/v1/albums#edit
#                                            api_v1_album GET        /api/v1/albums/:id(.:format)                                                                api/v1/albums#show
#                                                         PATCH      /api/v1/albums/:id(.:format)                                                                api/v1/albums#update
#                                                         PUT        /api/v1/albums/:id(.:format)                                                                api/v1/albums#update
#                                                         DELETE     /api/v1/albums/:id(.:format)                                                                api/v1/albums#destroy
#                                          api_v1_artists GET        /api/v1/artists(.:format)                                                                   api/v1/artists#index
#                                                         POST       /api/v1/artists(.:format)                                                                   api/v1/artists#create
#                                       new_api_v1_artist GET        /api/v1/artists/new(.:format)                                                               api/v1/artists#new
#                                      edit_api_v1_artist GET        /api/v1/artists/:id/edit(.:format)                                                          api/v1/artists#edit
#                                           api_v1_artist GET        /api/v1/artists/:id(.:format)                                                               api/v1/artists#show
#                                                         PATCH      /api/v1/artists/:id(.:format)                                                               api/v1/artists#update
#                                                         PUT        /api/v1/artists/:id(.:format)                                                               api/v1/artists#update
#                                                         DELETE     /api/v1/artists/:id(.:format)                                                               api/v1/artists#destroy
#                                  songs_api_v1_play_list GET        /api/v1/play_lists/:id/songs(.:format)                                                      api/v1/play_lists#songs
#                              featured_api_v1_play_lists GET        /api/v1/play_lists/featured(.:format)                                                       api/v1/play_lists#featured
#                                       api_v1_play_lists GET        /api/v1/play_lists(.:format)                                                                api/v1/play_lists#index
#                                                         POST       /api/v1/play_lists(.:format)                                                                api/v1/play_lists#create
#                                    new_api_v1_play_list GET        /api/v1/play_lists/new(.:format)                                                            api/v1/play_lists#new
#                                   edit_api_v1_play_list GET        /api/v1/play_lists/:id/edit(.:format)                                                       api/v1/play_lists#edit
#                                        api_v1_play_list GET        /api/v1/play_lists/:id(.:format)                                                            api/v1/play_lists#show
#                                                         PATCH      /api/v1/play_lists/:id(.:format)                                                            api/v1/play_lists#update
#                                                         PUT        /api/v1/play_lists/:id(.:format)                                                            api/v1/play_lists#update
#                                                         DELETE     /api/v1/play_lists/:id(.:format)                                                            api/v1/play_lists#destroy
#                                           backend_users GET        /backend/users(.:format)                                                                    backend/users#index
#                                                         POST       /backend/users(.:format)                                                                    backend/users#create
#                                        new_backend_user GET        /backend/users/new(.:format)                                                                backend/users#new
#                                       edit_backend_user GET        /backend/users/:id/edit(.:format)                                                           backend/users#edit
#                                            backend_user GET        /backend/users/:id(.:format)                                                                backend/users#show
#                                                         PATCH      /backend/users/:id(.:format)                                                                backend/users#update
#                                                         PUT        /backend/users/:id(.:format)                                                                backend/users#update
#                                                         DELETE     /backend/users/:id(.:format)                                                                backend/users#destroy
#                autocomplete_category_name_backend_songs GET        /backend/songs/autocomplete_category_name(.:format)                                         backend/songs#autocomplete_category_name
#                  autocomplete_artist_name_backend_songs GET        /backend/songs/autocomplete_artist_name(.:format)                                           backend/songs#autocomplete_artist_name
#                   autocomplete_album_name_backend_songs GET        /backend/songs/autocomplete_album_name(.:format)                                            backend/songs#autocomplete_album_name
#                                           backend_songs GET        /backend/songs(.:format)                                                                    backend/songs#index
#                                                         POST       /backend/songs(.:format)                                                                    backend/songs#create
#                                        new_backend_song GET        /backend/songs/new(.:format)                                                                backend/songs#new
#                                       edit_backend_song GET        /backend/songs/:id/edit(.:format)                                                           backend/songs#edit
#                                            backend_song GET        /backend/songs/:id(.:format)                                                                backend/songs#show
#                                                         PATCH      /backend/songs/:id(.:format)                                                                backend/songs#update
#                                                         PUT        /backend/songs/:id(.:format)                                                                backend/songs#update
#                                                         DELETE     /backend/songs/:id(.:format)                                                                backend/songs#destroy
#                                          backend_tracks GET        /backend/tracks(.:format)                                                                   backend/tracks#index
#                                                         POST       /backend/tracks(.:format)                                                                   backend/tracks#create
#                                       new_backend_track GET        /backend/tracks/new(.:format)                                                               backend/tracks#new
#                                      edit_backend_track GET        /backend/tracks/:id/edit(.:format)                                                          backend/tracks#edit
#                                           backend_track GET        /backend/tracks/:id(.:format)                                                               backend/tracks#show
#                                                         PATCH      /backend/tracks/:id(.:format)                                                               backend/tracks#update
#                                                         PUT        /backend/tracks/:id(.:format)                                                               backend/tracks#update
#                                                         DELETE     /backend/tracks/:id(.:format)                                                               backend/tracks#destroy
#                                          backend_albums GET        /backend/albums(.:format)                                                                   backend/albums#index
#                                                         POST       /backend/albums(.:format)                                                                   backend/albums#create
#                                       new_backend_album GET        /backend/albums/new(.:format)                                                               backend/albums#new
#                                      edit_backend_album GET        /backend/albums/:id/edit(.:format)                                                          backend/albums#edit
#                                           backend_album GET        /backend/albums/:id(.:format)                                                               backend/albums#show
#                                                         PATCH      /backend/albums/:id(.:format)                                                               backend/albums#update
#                                                         PUT        /backend/albums/:id(.:format)                                                               backend/albums#update
#                                                         DELETE     /backend/albums/:id(.:format)                                                               backend/albums#destroy
#          autocomplete_musical_band_name_backend_artists GET        /backend/artists/autocomplete_musical_band_name(.:format)                                   backend/artists#autocomplete_musical_band_name
#                                         backend_artists GET        /backend/artists(.:format)                                                                  backend/artists#index
#                                                         POST       /backend/artists(.:format)                                                                  backend/artists#create
#                                      new_backend_artist GET        /backend/artists/new(.:format)                                                              backend/artists#new
#                                     edit_backend_artist GET        /backend/artists/:id/edit(.:format)                                                         backend/artists#edit
#                                          backend_artist GET        /backend/artists/:id(.:format)                                                              backend/artists#show
#                                                         PATCH      /backend/artists/:id(.:format)                                                              backend/artists#update
#                                                         PUT        /backend/artists/:id(.:format)                                                              backend/artists#update
#                                                         DELETE     /backend/artists/:id(.:format)                                                              backend/artists#destroy
#                                      backend_categories GET        /backend/categories(.:format)                                                               backend/categories#index
#                                                         POST       /backend/categories(.:format)                                                               backend/categories#create
#                                    new_backend_category GET        /backend/categories/new(.:format)                                                           backend/categories#new
#                                   edit_backend_category GET        /backend/categories/:id/edit(.:format)                                                      backend/categories#edit
#                                        backend_category GET        /backend/categories/:id(.:format)                                                           backend/categories#show
#                                                         PATCH      /backend/categories/:id(.:format)                                                           backend/categories#update
#                                                         PUT        /backend/categories/:id(.:format)                                                           backend/categories#update
#                                                         DELETE     /backend/categories/:id(.:format)                                                           backend/categories#destroy
#                                   backend_subscriptions GET        /backend/subscriptions(.:format)                                                            backend/subscriptions#index
#                                                         POST       /backend/subscriptions(.:format)                                                            backend/subscriptions#create
#                                new_backend_subscription GET        /backend/subscriptions/new(.:format)                                                        backend/subscriptions#new
#                               edit_backend_subscription GET        /backend/subscriptions/:id/edit(.:format)                                                   backend/subscriptions#edit
#                                    backend_subscription GET        /backend/subscriptions/:id(.:format)                                                        backend/subscriptions#show
#                                                         PATCH      /backend/subscriptions/:id(.:format)                                                        backend/subscriptions#update
#                                                         PUT        /backend/subscriptions/:id(.:format)                                                        backend/subscriptions#update
#                                                         DELETE     /backend/subscriptions/:id(.:format)                                                        backend/subscriptions#destroy
#                                       backend_languages GET        /backend/languages(.:format)                                                                backend/languages#index
#                                                         POST       /backend/languages(.:format)                                                                backend/languages#create
#                                    new_backend_language GET        /backend/languages/new(.:format)                                                            backend/languages#new
#                                   edit_backend_language GET        /backend/languages/:id/edit(.:format)                                                       backend/languages#edit
#                                        backend_language GET        /backend/languages/:id(.:format)                                                            backend/languages#show
#                                                         PATCH      /backend/languages/:id(.:format)                                                            backend/languages#update
#                                                         PUT        /backend/languages/:id(.:format)                                                            backend/languages#update
#                                                         DELETE     /backend/languages/:id(.:format)                                                            backend/languages#destroy
#                                       backend_analytics GET        /backend/analytics(.:format)                                                                backend/analytics#index
#                                                         POST       /backend/analytics(.:format)                                                                backend/analytics#create
#                                    new_backend_analytic GET        /backend/analytics/new(.:format)                                                            backend/analytics#new
#                                   edit_backend_analytic GET        /backend/analytics/:id/edit(.:format)                                                       backend/analytics#edit
#                                        backend_analytic GET        /backend/analytics/:id(.:format)                                                            backend/analytics#show
#                                                         PATCH      /backend/analytics/:id(.:format)                                                            backend/analytics#update
#                                                         PUT        /backend/analytics/:id(.:format)                                                            backend/analytics#update
#                                                         DELETE     /backend/analytics/:id(.:format)                                                            backend/analytics#destroy
#                                    backend_ad_positions GET        /backend/ad_positions(.:format)                                                             backend/ad_positions#index
#                                                         POST       /backend/ad_positions(.:format)                                                             backend/ad_positions#create
#                                 new_backend_ad_position GET        /backend/ad_positions/new(.:format)                                                         backend/ad_positions#new
#                                edit_backend_ad_position GET        /backend/ad_positions/:id/edit(.:format)                                                    backend/ad_positions#edit
#                                     backend_ad_position GET        /backend/ad_positions/:id(.:format)                                                         backend/ad_positions#show
#                                                         PATCH      /backend/ad_positions/:id(.:format)                                                         backend/ad_positions#update
#                                                         PUT        /backend/ad_positions/:id(.:format)                                                         backend/ad_positions#update
#                                                         DELETE     /backend/ad_positions/:id(.:format)                                                         backend/ad_positions#destroy
#                                  backend_advertisements GET        /backend/advertisements(.:format)                                                           backend/advertisements#index
#                                                         POST       /backend/advertisements(.:format)                                                           backend/advertisements#create
#                               new_backend_advertisement GET        /backend/advertisements/new(.:format)                                                       backend/advertisements#new
#                              edit_backend_advertisement GET        /backend/advertisements/:id/edit(.:format)                                                  backend/advertisements#edit
#                                   backend_advertisement GET        /backend/advertisements/:id(.:format)                                                       backend/advertisements#show
#                                                         PATCH      /backend/advertisements/:id(.:format)                                                       backend/advertisements#update
#                                                         PUT        /backend/advertisements/:id(.:format)                                                       backend/advertisements#update
#                                                         DELETE     /backend/advertisements/:id(.:format)                                                       backend/advertisements#destroy
#                                      backend_play_lists GET        /backend/play_lists(.:format)                                                               backend/play_lists#index
#                                                         POST       /backend/play_lists(.:format)                                                               backend/play_lists#create
#                                   new_backend_play_list GET        /backend/play_lists/new(.:format)                                                           backend/play_lists#new
#                                  edit_backend_play_list GET        /backend/play_lists/:id/edit(.:format)                                                      backend/play_lists#edit
#                                       backend_play_list GET        /backend/play_lists/:id(.:format)                                                           backend/play_lists#show
#                                                         PATCH      /backend/play_lists/:id(.:format)                                                           backend/play_lists#update
#                                                         PUT        /backend/play_lists/:id(.:format)                                                           backend/play_lists#update
#                                                         DELETE     /backend/play_lists/:id(.:format)                                                           backend/play_lists#destroy
#                                   backend_musical_bands GET        /backend/musical_bands(.:format)                                                            backend/musical_bands#index
#                                                         POST       /backend/musical_bands(.:format)                                                            backend/musical_bands#create
#                                new_backend_musical_band GET        /backend/musical_bands/new(.:format)                                                        backend/musical_bands#new
#                               edit_backend_musical_band GET        /backend/musical_bands/:id/edit(.:format)                                                   backend/musical_bands#edit
#                                    backend_musical_band GET        /backend/musical_bands/:id(.:format)                                                        backend/musical_bands#show
#                                                         PATCH      /backend/musical_bands/:id(.:format)                                                        backend/musical_bands#update
#                                                         PUT        /backend/musical_bands/:id(.:format)                                                        backend/musical_bands#update
#                                                         DELETE     /backend/musical_bands/:id(.:format)                                                        backend/musical_bands#destroy
#

Rails.application.routes.draw do
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
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
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
            member do
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
    resources :play_lists
    resources :musical_bands
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
  end
end
