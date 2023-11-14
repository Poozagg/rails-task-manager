Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # LIST ALL THE TASKS
  get 'tasks', to: 'tasks#index'

  #   2 steps to create new task 1) get the creation form 2)post the parameters to create new task
  # 1) GET THE FORM
  get 'tasks/new', to: 'tasks#new'
  # 2) POST THE NEW TASK
  post 'tasks', to: 'tasks#create'

  # SHOW A TASK
  get 'tasks/:id', to: 'tasks#show', as: :task

  # EDIT A TASK
  # 1) CREATE FORM + GET THE TASK BY ID
  get 'tasks/:id/edit', to: 'tasks#edit', as: :edit
  # 2) PATCH/UPDATE THE TASK WITH THE PARAMS OF THE FORM
  patch 'tasks/:id', to: 'tasks#update'

  # DELETE A TASK FROM EXISTING LIST
  delete 'tasks/:id', to: 'tasks#destroy', as: 'destroy'
end
