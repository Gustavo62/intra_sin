Rails.application.routes.draw do  
  namespace :intranet do
    resources :arquivos_tipos
  end
    if $user
      namespace :intranet, path: 'usuario/intranet' do
        resources :departamentos , as: 'departamentos'  
        resources :privilegios   , as: 'privilegios'  
        resources :cidades       , as: 'cidades'  
        resources :entrancia     , as: 'entrancia'  
        resources :contribuicaos , as: 'contribuicaos'  
        resources :regiaos       , as: 'regiaos'  
        resources :atividades    , as: 'atividades'  
        resources :avisos        , as: 'avisos' 
      end  
    else
      namespace :intranet, path: 'administrador/intranet' do
        resources :departamentos , as: 'departamentos'  
        resources :privilegios   , as: 'privilegios'  
        resources :cidades       , as: 'cidades'  
        resources :entrancia     , as: 'entrancia'  
        resources :contribuicaos , as: 'contribuicaos'  
        resources :regiaos       , as: 'regiaos'  
        resources :atividades    , as: 'atividades'  
        resources :avisos        , as: 'avisos' 
      end  
    end
  get 'administrador/home', to: 'administrador#home'  
  get 'usuario/home', to: 'usuario#home'    
  
  root :to => redirect('usuario/home')

	devise_for :admin, path: 'administrador', controllers: {
    :sessions => "admins/sessions",
    :registrations => "admins/registrations", 
    :confirmations => "admins/confirmations", 
    :passwords => "admins/passwords", 
    :unlocks => "admins/unlocks", 
    :omniauth => "admins/"},path_names: { sign_in:      'entrar', 
    sign_out:     'sair',
    password:     'secret',
    confirmation: 'virificação',
    unlock:       'desbloquear', 
    registration: 'registro',
    sign_up:      'cadastrar-se' } 

  devise_for :user, path: 'usuario', controllers: {
    :sessions => "users/sessions",
    :registrations => "users/registrations", 
    :confirmations => "users/confirmations", 
    :passwords => "users/passwords", 
    :unlocks => "users/unlocks", 
    :omniauth => "users/"},path_names: { sign_in:      'entrar', 
    sign_out:     'sair',
    password:     'secret',
    confirmation: 'virificação',
    unlock:       'desbloquear', 
    registration: 'registro',
    sign_up:      'cadastrar-se' }  
end
