class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @exercises = @user.exercises.all.order(id: 'DESC')
    @daiets = @user.daiets.all.order(id: 'DESC')
    @learns = @user.learns.all.order(id: 'DESC')
    @savings = @user.savings.all.order(id: 'DESC')
    @minds  = @user.minds.all.order(id: 'DESC')
    @earlies = @user.earlies.all.order(id: 'DESC')
  end

end
