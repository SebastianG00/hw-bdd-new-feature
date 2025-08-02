Rottenpotatoes::Application.routes.draw do
  resources :movies do
  # Add new routes here
  #SOURCE: https://stackoverflow.com/questions/3028653/difference-between-collection-route-and-member-route-in-ruby-on-rails
    get 'same', on: :member
  end
  root to: redirect('/movies')
end
