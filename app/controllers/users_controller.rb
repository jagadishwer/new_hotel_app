class UsersController < Devise::RegistrationsController
  #prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
#load_and_authorize_resource

before_filter :authenticate_user!
end
