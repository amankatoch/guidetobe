Gtb::Application.routes.draw do

  get 'home', to: 'regions#index'
  get 'about', to: 'pages#about'
  get 'advertise_with_us', to: 'pages#advertise_with_us'
  get 'business_listings', to: 'pages#business_listings'
  get 'business_claim_listings', to: 'pages#business_claim_listings'
  get 'terms', to: 'pages#terms'
  get 'faqs', to: 'pages#faqs'
  get 'gettingreviews', to: 'pages#gettingreviews'
  get 'tool', to: 'pages#tool'
  get 'cookies', to: 'pages#cookies'
  get 'privacy', to: 'pages#privacy'
  get 'supplier_terms', to: 'pages#supplier_terms'
  get 'contact', to: 'pages#contact'
  get 'business', to: 'pages#business'
  get 'competition', to: 'pages#competition'
  get 'thankyoubride', to: 'pages#thankyoubride'
  get 'thankyoupremium', to: 'pages#thankyoupremium'
  get 'media', to: 'pages#media'
  get 'sitemap.xml', to: 'sitemap#index', as: 'sitemap', defaults: { format: 'xml' }
  get 'download', to: 'pages#download', as: 'download_pdf'
  get 'adminlogout', to: 'admin/sessions#destroy', as: 'adminlogout'
  get 'error', to: 'pages#error'


  get '/cities', to: redirect("/regions", status: 301)
  get '/cities/glasgow', to: redirect("/regions/scotland", status: 301)
  get '/cities/birmingham', to: redirect("/regions/west-midlands", status: 301)
  get '/cities/leeds', to: redirect("/regions/yorkshire", status: 301)
  get '/cities/manchester', to: redirect("/regions/north-west", status: 301)
  get '/cities/newcastle', to: redirect("/regions/north-east", status: 301)
  get '/cities/london', to: redirect("/regions/london-south-east", status: 301)
  get '/cities/cardiff', to: redirect("/regions/north-west", status: 301)


  get '/cities/cardiff/categories/accessories', to: redirect("/regions/north-west/categories/accessories", status: 301)
  get '/cities/cardiff/categories/cakes', to: redirect("/regions/north-west/categories/cakes", status: 301)
  get '/cities/cardiff/categories/dresses', to: redirect("/regions/north-west/categories/dresses", status: 301)
  get '/cities/cardiff/categories/entertainnment', to: redirect("/regions/north-west/categories/entertainment", status: 301)
  get '/cities/cardiff/categories/photographers', to: redirect("/regions/north-west/categories/photographers", status: 301)
  get '/cities/cardiff/categories/stationery', to: redirect("/regions/north-west/categories/stationery", status: 301)
  get '/cities/cardiff/categories/cars', to: redirect("/regions/north-west/categories/cars", status: 301)
  get '/cities/cardiff/categories/florists', to: redirect("/regions/north-west/categories/florists", status: 301)
  get '/cities/cardiff/categories/venues', to: redirect("/regions/north-west/categories/venues", status: 301)
  get '/cities/cardiff/categories/catering', to: redirect("/regions/north-west/categories/catering", status: 301)
  get '/cities/cardiff/categories/hair-and-make-up', to: redirect("/regions/north-west/categories/hair-and-make-up", status: 301)

  get '/cities/london/categories/accessories', to: redirect("/regions/london-south-east/categories/accessories", status: 301)
  get '/cities/london/categories/cakes', to: redirect("/regions/london-south-east/categories/cakes", status: 301)
  get '/cities/london/categories/dresses', to: redirect("/regions/london-south-east/categories/dresses", status: 301)
  get '/cities/london/categories/entertainnment', to: redirect("/regions/london-south-east/categories/entertainment", status: 301)
  get '/cities/london/categories/photographers', to: redirect("/regions/london-south-east/categories/photographers", status: 301)
  get '/cities/london/categories/stationery', to: redirect("/regions/london-south-east/categories/stationery", status: 301)
  get '/cities/london/categories/cars', to: redirect("/regions/london-south-east/categories/cars", status: 301)
  get '/cities/london/categories/florists', to: redirect("/regions/london-south-east/categories/florists", status: 301)
  get '/cities/london/categories/venues', to: redirect("/regions/london-south-east/categories/venues", status: 301)
  get '/cities/london/categories/catering', to: redirect("/regions/london-south-east/categories/catering", status: 301)
  get '/cities/london/categories/hair-and-make-up', to: redirect("/regions/london-south-east/categories/hair-and-make-up", status: 301)

  get '/cities/newcastle/categories/accessories', to: redirect("/regions/north-east/categories/accessories", status: 301)
  get '/cities/newcastle/categories/cakes', to: redirect("/regions/north-east/categories/cakes", status: 301)
  get '/cities/newcastle/categories/dresses', to: redirect("/regions/north-east/categories/dresses", status: 301)
  get '/cities/newcastle/categories/entertainnment', to: redirect("/regions/north-east/categories/entertainment", status: 301)
  get '/cities/newcastle/categories/photographers', to: redirect("/regions/north-east/categories/photographers", status: 301)
  get '/cities/newcastle/categories/stationery', to: redirect("/regions/north-east/categories/stationery", status: 301)
  get '/cities/newcastle/categories/cars', to: redirect("/regions/north-east/categories/cars", status: 301)
  get '/cities/newcastle/categories/florists', to: redirect("/regions/north-east/categories/florists", status: 301)
  get '/cities/newcastle/categories/venues', to: redirect("/regions/north-east/categories/venues", status: 301)
  get '/cities/newcastle/categories/catering', to: redirect("/regions/north-east/categories/catering", status: 301)
  get '/cities/newcastle/categories/hair-and-make-up', to: redirect("/regions/north-east/categories/hair-and-make-up", status: 301)

  get '/cities/manchester/categories/accessories', to: redirect("/regions/north-west/categories/accessories", status: 301)
  get '/cities/manchester/categories/cakes', to: redirect("/regions/north-west/categories/cakes", status: 301)
  get '/cities/manchester/categories/dresses', to: redirect("/regions/north-west/categories/dresses", status: 301)
  get '/cities/manchester/categories/entertainnment', to: redirect("/regions/north-west/categories/entertainment", status: 301)
  get '/cities/manchester/categories/photographers', to: redirect("/regions/north-west/categories/photographers", status: 301)
  get '/cities/manchester/categories/stationery', to: redirect("/regions/north-west/categories/stationery", status: 301)
  get '/cities/manchester/categories/cars', to: redirect("/regions/north-west/categories/cars", status: 301)
  get '/cities/manchester/categories/florists', to: redirect("/regions/north-west/categories/florists", status: 301)
  get '/cities/manchester/categories/venues', to: redirect("/regions/north-west/categories/venues", status: 301)
  get '/cities/manchester/categories/catering', to: redirect("/regions/north-west/categories/catering", status: 301)
  get '/cities/manchester/categories/hair-and-make-up', to: redirect("/regions/north-west/categories/hair-and-make-up", status: 301)

  get '/cities/leeds/categories/accessories', to: redirect("/regions/yorkshire/categories/accessories", status: 301)
  get '/cities/leeds/categories/cakes', to: redirect("/regions/yorkshire/categories/cakes", status: 301)
  get '/cities/leeds/categories/dresses', to: redirect("/regions/yorkshire/categories/dresses", status: 301)
  get '/cities/leeds/categories/entertainnment', to: redirect("/regions/yorkshire/categories/entertainment", status: 301)
  get '/cities/leeds/categories/photographers', to: redirect("/regions/yorkshire/categories/photographers", status: 301)
  get '/cities/leeds/categories/stationery', to: redirect("/regions/yorkshire/categories/stationery", status: 301)
  get '/cities/leeds/categories/cars', to: redirect("/regions/yorkshire/categories/cars", status: 301)
  get '/cities/leeds/categories/florists', to: redirect("/regions/yorkshire/categories/florists", status: 301)
  get '/cities/leeds/categories/venues', to: redirect("/regions/yorkshire/categories/venues", status: 301)
  get '/cities/leeds/categories/catering', to: redirect("/regions/yorkshire/categories/catering", status: 301)
  get '/cities/leeds/categories/hair-and-make-up', to: redirect("/regions/yorkshire/categories/hair-and-make-up", status: 301)

  get '/cities/birmingham/categories/accessories', to: redirect("/regions/west-midlands/categories/accessories", status: 301)
  get '/cities/birmingham/categories/cakes', to: redirect("/regions/west-midlands/categories/cakes", status: 301)
  get '/cities/birmingham/categories/dresses', to: redirect("/regions/west-midlands/categories/dresses", status: 301)
  get '/cities/birmingham/categories/entertainnment', to: redirect("/regions/west-midlands/categories/entertainment", status: 301)
  get '/cities/birmingham/categories/photographers', to: redirect("/regions/west-midlands/categories/photographers", status: 301)
  get '/cities/birmingham/categories/stationery', to: redirect("/regions/west-midlands/categories/stationery", status: 301)
  get '/cities/birmingham/categories/cars', to: redirect("/regions/west-midlands/categories/cars", status: 301)
  get '/cities/birmingham/categories/florists', to: redirect("/regions/west-midlands/categories/florists", status: 301)
  get '/cities/birmingham/categories/venues', to: redirect("/regions/west-midlands/categories/venues", status: 301)
  get '/cities/birmingham/categories/catering', to: redirect("/regions/west-midlands/categories/catering", status: 301)
  get '/cities/birmingham/categories/hair-and-make-up', to: redirect("/regions/west-midlands/categories/hair-and-make-up", status: 301)

  get '/cities/glasgow/categories/accessories', to: redirect("/regions/scotland/categories/accessories", status: 301)
  get '/cities/glasgow/categories/cakes', to: redirect("/regions/scotland/categories/cakes", status: 301)
  get '/cities/glasgow/categories/dresses', to: redirect("/regions/scotland/categories/dresses", status: 301)
  get '/cities/glasgow/categories/entertainnment', to: redirect("/regions/scotland/categories/entertainment", status: 301)
  get '/cities/glasgow/categories/photographers', to: redirect("/regions/scotland/categories/photographers", status: 301)
  get '/cities/glasgow/categories/stationery', to: redirect("/regions/scotland/categories/stationery", status: 301)
  get '/cities/glasgow/categories/cars', to: redirect("/regions/scotland/categories/cars", status: 301)
  get '/cities/glasgow/categories/florists', to: redirect("/regions/scotland/categories/florists", status: 301)
  get '/cities/glasgow/categories/venues', to: redirect("/regions/scotland/categories/venues", status: 301)
  get '/cities/glasgow/categories/catering', to: redirect("/regions/scotland/categories/catering", status: 301)
  get '/cities/glasgow/categories/hair-and-make-up', to: redirect("/regions/scotland/categories/hair-and-make-up", status: 301)


  resources :city_requests, only: [:new, :create]
  resources :ad_requests, only: [:new, :create]
  resources :posts, only: [:index, :show]
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :brides, only: [:new, :create, :edit, :update] do
    resources :reviews, only: :index
  end
  resources :reviews, only: [:new, :create] do
    resources :reports, only: [:create]
    resources :replies, only: [:new, :create]
    resources :likes, only: [:create]
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :password_resets
  resources :regions, only: [:index, :show] do
    resources :categories, only: [:show]
  end
  resources :categories, only: :show
  resources :suppliers, except: [:destroy, :index] do
    resources :reviews, only: [:new, :create]
  end
  get 'signup_complete', to: 'owners#added', as: 'free_signup_complete'
  resources :products, only: [:index]

  resources :owners, only: [:new, :create, :edit, :update] do
    get 'edit_profile', to: 'owners#edit_profile', as: 'edit_profile'
    put 'update_profile', to: 'owners#update_profile', as: 'update_profile'
    get 'downgrade', to: 'owners#downgrade', as: 'downgrade'
    post 'downgrade', to: 'owners#accept_downgrade', as: 'accept_downgrade'
  end
  resources :search_suggestions, only: [:index, :show]
  resources :supplier_suggestions, only: [:index]
  resources :ad_requests, only: [:new, :create]
  resources :contacts, only: [:new, :create]
  resources :invoices, only: [:edit, :update] do
    get 'invoice_paid', to: 'invoices#invoice_paid', as: 'paid'
  end



  get '/buy/:id', to: 'transactions#new', as: :show_buy
  post '/buy/:id', to: 'transactions#create', as: :buy
  get '/pickup/:guid', to: 'transactions#pickup', as: :pickup
  get 'pickup/upgrade/:guid', to: 'transactions#upgrade', as: :upgrade
  resources :stripe_events, only: [:create]

  get 'signup', to: 'brides#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resource :dashboard, only: [:show]
    resources :suppliers do
      post "import_suppliers", on: :collection
    end
    resources :products
    resources :brides
    resources :owners
    resources :reviews do
      member { get 'toggle_visibility' }
    end
    resources :city_requests, only: [:index]
    resources :ad_requests, only: [:index]
    resources :posts
    resources :advertisements do
      resources :invoices
    end
    get 'competition', to: 'competition#show', as: 'competition'
    get 'media', to: 'media#show', as: 'media'
  end

  root to: 'regions#index'
  # root to: 'pages#home'
end
