module Account
  class AccountController < ApplicationController
    before_action :authenticate_user!

  end
end
