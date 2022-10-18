class GymsController < ApplicationController
    
    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def show
        gym = Gym.find_by(id: params[:id])
        if gym
            render json: gym, status: :ok
        else
            render json: { error: "Gym Not Found!" }, status: :not_found
        end
    end
    
    def update
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.update(gym_params)
            render json: gym, status: :ok
        else
            render json: { error: "Gym Not Found!" }, status: :not_found
        end
    end

    def destroy
        gym = Gym.find_by(id: params[:id])
        if gym
            gym.destroy
            render json: {}, status: :no_content
        else
            render json: { error: "Gym Not Found!" }, status: :not_found
        end
    end

    private
    
    def gym_params
        params.permit(:name, :address)
    end
end
