Rails.application.routes.draw do
  resources :contacts do
    resources :referrals
  end

  resources :leaderboard
end
