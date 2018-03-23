class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.titles.create(params[:title]) unless params[:title][:name].empty?
    landmark = params[:landmark]
    figure.landmarks.create(landmark) unless landmark[:name].empty?
    redirect "/figures/#{figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @landmarks = @figure.landmarks
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.titles.create(params[:title]) unless params[:title][:name].empty?
    landmark = params[:landmark]
    figure.landmarks.create(landmark) unless landmark[:name].empty?
    redirect "/figures/#{figure.id}"
  end
end
