class CelebsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data

    #Show all celebrities
    def index
        render json: @celebrities
    end

    #Show a single celebrity
    def show
        @celebrity = @celebrities(params[:id].to_i)
        render json: @celebrities
    end

    #Create a new celebrity
    def create
        @celebrities << {
            name: params[:name],
            notability: params[:notability]
        }
        render json: @celebrities
    end

    #Update a celebrity
    def update
        # find celeb by id
        @celebrity = @celebrities(params[:id].to_i)
        #update celeb from params
        @celebrity[:name] = params[:name]
        @celebrity[:notability] = params[:notability]
        #return the celeb
        render json: @celebrity
    
    end

    #Remove a celebrity
    def destroy
        @celebrities.delete_at(params[:id].to_i])
        render json: @celebrities
    end

    private
    def setup_data
        @celebs = [
            { name: "Lindsay Lohan", notability: "Parent Trap" },
            { name: "Adam Sandler", notability: "Big Daddy" },
            { name: "Rob Schnider", notability: "Adam Sandler" }
        ]
    end
end