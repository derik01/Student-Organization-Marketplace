class MemberController < ApplicationController 
  skip_before_action :verify_authenticity_token

    def new
      @member = Member.new
    end
  end