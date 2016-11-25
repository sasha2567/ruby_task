Rails.application.routes.draw do
  devise_for :users
  root 'payments#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/payments/show', 							as: 'user_root'
  get  '/payments',		 to: 'payments#show', 		as: 'paymentsIndex' 
  get  '/payments/:page', to: 'payments#show', 		as: 'paymentsPage'
  
  post '/payments/add', 	 to: 'payments#add', as: 'addPayments'
  post '/payments/delete',to: 'payments#delete', as: 'deletePayments'

end
