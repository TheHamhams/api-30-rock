module Api
    module V1
        class EpisodesController < ApplicationController
            
            ALLOWED_DATA = %[title, season_num, episode_num].freeze

            def index
                episodes = Episode.all
                episodes = episodes.sort {|a, b| + (a['season_num'] <=> b['season_num'])}
                render json: episodes, except: [:created_at, :updated_at]
            end

            def show 
                episode = Episode.find(params[:id])
                if episode 
                    render json: episode
                end
            end

            def create 
                data = json_payload.select {|k| ALLOWED_DATA.include?(k)} 
                episode = Episode.new(data)
                if episode.save
                    render json: episode 
                else
                    render json: {"error": "episode was not created"}
                end 
            end 

            def destroy 
                episode = Episode.find(params[:id])
                episode.destroy
                render json: {"deleted": "episode deleted"}
            end

        end
    end
end
