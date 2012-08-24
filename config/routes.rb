CurulApi::Application.routes.draw do

  resources :comments, except: :edit

  resources :initiatives, except: :edit

  devise_for :admins, :controllers => { :sessions => "sessions" }

  namespace :v1 do
    resources :applications, except: [:edit, :new]
    resources :admins, except: [:edit, :new]
    resources :states, except: [:edit, :new]
    resources :commissions, except: [:edit, :new]
    resources :representatives, except: [:edit, :new]
    resources :legislatures, except: [:edit, :new]
    resources :political_parties, except: [:edit, :new]
    resources :initiatives, except: [:edit, :new]
    resources :comments, except: [:edit, :new]
  end
end
