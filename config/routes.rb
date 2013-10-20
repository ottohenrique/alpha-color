Alpha::Application.routes.draw do
  post 'vote' => 'votes#create'
  get 'stats' => 'votes#index', as: :stats
  root 'votes#new'
end
