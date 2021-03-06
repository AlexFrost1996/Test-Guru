Rails.application.routes.draw do
  root to: 'tests#index'
  
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}
  
  resources :feedbacks, only: %i[new create]
  resources :badges, path: :achivements, only: %i[index show]

  resources :tests, only: :index do
    resources :questions, only: :show, shallow: true, except: :index do
      resources :answers, only: :show, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index]
    resources :badges, path: :achivements
  end
end
