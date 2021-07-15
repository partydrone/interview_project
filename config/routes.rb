Rails.application.routes.draw do
  resources :exercise_assignments, except: [:edit, :update]
end
