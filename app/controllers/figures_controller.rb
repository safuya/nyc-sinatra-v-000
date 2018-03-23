class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.titles.create(params[:title]) unless params[:title][:name].empty?
    figure.landmarks.create(params[:landmark]) unless params[:landmark][:name].empty?
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end
end
