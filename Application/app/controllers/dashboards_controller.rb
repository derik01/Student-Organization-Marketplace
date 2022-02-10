class DashboardsController < ApplicationController
    skip_before_action :verify_authenticity_token
    layout 'dashboard'
 
  end
