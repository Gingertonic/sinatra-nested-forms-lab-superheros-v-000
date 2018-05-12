require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :super_hero
    end

    post '/team' do
      @team = Team.new(params[:team])

      params[:team][:members].each do |member_details|
        Superhero.new(member_details)
      end

      @members = Superhero.all

      erb :team
    end
end
