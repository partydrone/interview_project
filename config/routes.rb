Rails.application.routes.draw do
  resources :members
  resources :exercise_assignments, except: [:edit, :update]
end
