# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get '/', to: 'application#index'
  get '/about', to: 'application#about'
  get '/contacts', to: 'application#contacts'
  get '/reviews', to: 'application#reviews'
  get '/teachers', to: 'application#teachers'
  
  get '/schedule', to: 'application#schedule'
  post '/schedule', to: 'application#filledschedule'

  get '/news/:id', to: 'news#view'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/admin', to: 'admin#index'

  get '/admin/teachers', to: 'admin_teachers#index'
  get '/admin/teachers/new', to: 'admin_teachers#new'
  post '/admin/teachers/create', to: 'admin_teachers#create'
  get '/admin/teachers/:id/edit', to: 'admin_teachers#edit'
  patch '/admin/teachers/:id/save', to: 'admin_teachers#save'
  delete '/admin/teachers/:id/delete', to: 'admin_teachers#destroy'

  get '/admin/posts', to: 'admin_posts#index'
  get '/admin/posts/new', to: 'admin_posts#new'
  post '/admin/posts/create', to: 'admin_posts#create'
  get '/admin/posts/:id/edit', to: 'admin_posts#edit'
  patch '/admin/posts/:id/save', to: 'admin_posts#save'
  delete '/admin/posts/:id/delete', to: 'admin_posts#destroy'

  get '/admin/schedule', to: 'admin_schedule#index'
  get '/admin/schedule/new', to: 'admin_schedule#new'
  post '/admin/schedule/create', to: 'admin_schedule#create'
  get '/admin/schedule/:id/edit', to: 'admin_schedule#edit'
  patch '/admin/schedule/:id/save', to: 'admin_schedule#save'
  delete '/admin/schedule/:id/delete', to: 'admin_schedule#destroy'

  get '/admin/users', to: 'admin_users#index'
  delete '/admin/users/:id/delete', to: 'admin_users#destroy'

  get '/user/:id', to: 'users#view'
end
