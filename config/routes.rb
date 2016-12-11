Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/beers' => 'beers#index'
  get '/beers/new' => 'beers#new'
  post '/beers' => 'beers#create'
  get '/beers/:id' => 'beers#show'
  get '/beers/:id/edit' =>'beers#edit'
  patch '/beers/:id' => 'beers#update'
  delete '/beers/:id' => 'beers#destroy'


end
