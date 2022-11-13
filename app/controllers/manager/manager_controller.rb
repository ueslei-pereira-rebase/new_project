module Manager
  class ManagerController < ApplicationController
    before_action :authenticate_admin!

  end
end
