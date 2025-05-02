Rails.application.routes.draw do
  get "search/index"
  get "course/index"
  # root "first#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # root 'FirstController#home'
  #  get "new" => "first#new"

   
  # resources :users 
  #  resources :users do 
  #   resources :enrollments, only:[:index,:new,:create]
  #  end
  #  resources :courses
  # end
  # get "/users/:id", controller: "enrollments", action: :index

  #  get 'user#index'
  #  get 'user#show'
  #    get 'user#new'
  # resources :users
  # resources :courses
  #  resources :courses
  #  POST /courses => courses#create
get  '/create_course', to: 'course#new'
post '/create_course', to: 'course#create'
  
resources :users
     get 'user' => 'user#index'
       get '/user/:id' => 'user#show'
       get '/user_new' => 'user#new'
       post '/user_new' => 'user#create'
       get '/enrollment'=> 'enrollment#new'
        post '/enrollment'=> 'enrollment#create'
        get '/enrollment_index' => 'enrollment#index'
       
      get '/all_course'=> 'course#index'
      get'/create_course'=> 'course#new'
      get'/course/:id'=> 'course#show'
      get'/enrollment_index'=> 'enrollment#index'
      get'/user_index'=> 'user#index'
      get '/course_index'=> 'course#index'

      get '/search_status' => 'search#index'
       
      
      # resources :courses, only: [:new, :create, :index]

  # get 'enrollments#new'
  # get 'user/:id/enrollments' =>'enrollments#index'
  # get    /users/:user_id/enrollments => enrollments#index
  # get    /users/:user_id/enrollments/new => enrollments#new
  # post   /users/:user_id/enrollments  => enrollments#create
  
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
