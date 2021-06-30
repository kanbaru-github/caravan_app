Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs
  # indexからdestroyまでの7つのアクションのことを、RESTfulなURLと呼んでいます。
  # resourcesメソッドを利用すると、このRESTfulなURLを自動で設定してくれます。
  # コロン(:)をつける位置によってエラーがよく発生してしまいます。

end
