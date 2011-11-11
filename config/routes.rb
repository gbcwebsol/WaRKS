Warks::Application.routes.draw do

  resources :lobby, :only => ["index","show","new","create"] do
    collection do
      match "smartphone/:id", :action => "show_smartphone", :as => "smartphone"
    end
  end

  scope "/admin" do
    resources :section, :only => ["index","show","update"] do
      collection do      
        match "anaunce/:id", :via => :get, :action => "anaunce", :as => "anaunce"
      end
      member do
        match "guest" ,:via => :delete, :action => "destroy_guest"
        match "guest" ,:via => :put, :action => "update_guest"
        match "guest(/:guest_id)" ,:via => :post, :action => "create_guest", :as => "create_guest"
      end
    end
    resources :guest, :only => ["destroy"]
  end

end
