Rails.application.routes.draw do
  root to: 'leaderboard#index'

  resources :contacts do
    resources :referrals
  end

  resources :leaderboard
  resources :events
end
