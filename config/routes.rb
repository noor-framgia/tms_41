Rails.application.routes.draw do
  scope "(:locale)", :locale => /en/ do
    root	'static_pages#home'
    get 'home'=> 'static_pages#home'
    get 'about'=> 'static_pages#about'
    get 'contact'=> 'static_pages#contact'

    resource :reports
  end
end
