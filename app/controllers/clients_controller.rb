class ClientsController < ApplicationController

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def show
        client = Client.find_by(id: params[:id])
        if client
            render json: client, status: :ok, methods: [:total_amount_for_all_membership]
        else
            render json: { error: "Client Not Found!" }, status: :not_found
        end
    end

    def update
        client = Client.find_by(id: params[:id])
        if client
            client.update(client_params)
            render json: client, status: :ok
        else
            render json: { error: "Client Not Found!" }, status: :not_found
        end
    end

    def client_params
        params.permit(:name, :age)
    end
end
