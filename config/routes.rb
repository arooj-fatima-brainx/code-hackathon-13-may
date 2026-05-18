Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :briefs, only: [:create, :show] do
        member do
          post :generate_jira
        end
      end
    end
  end
end