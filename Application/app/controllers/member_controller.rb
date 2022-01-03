class MemberController < ApplicationController 
    def new
      @member = Member.new
    end
  end