Rails.application.routes.draw do
  resources :forums do
    resources :topics do
      resources :posts
      resource :monitorship, :controller => :monitorships
    end
  end

  resources :posts, :as => "all_posts" do
    collection do
      get :search
    end
  end

  %w(forum).each do |attr|
    resources :posts, :as => "#{attr}_posts", :path_prefix => "/#{attr.pluralize}/:#{attr}_id"
  end

  resources :topics
  resources :monitorship
end
