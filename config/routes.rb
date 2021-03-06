Rails.application.routes.draw do



  get 'articles', to: "articles#index"
  get 'articles/new', to: "articles#new"
  post 'articles', to: "articles#create"
  get 'articles/:id/edit', to: "articles#edit"
  patch 'articles/id', to: "articles#update"
  delete 'articles/id', to: "articles#destroy", as: "article/delete"

  get 'categories/new', to: "categories#new"
  get 'categories/:id', to: "categories#show",  as: "category"
  post 'categories', to: "categories#create"
  get 'categories/:id/edit', to: "categories#edit", as: "category/edit"
  patch 'categories/id', to: "categories#update"
  delete 'categories/id', to: "categories#destroy", as: "category/delete"



  root to: "articles#index"

end
