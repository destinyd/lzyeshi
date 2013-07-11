class User::PostsController < InheritedResources::Base
  layout 'user'
  actions :index, :destroy, :new, :create
end
