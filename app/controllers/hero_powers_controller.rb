class HeroPowersController < ApplicationController
    
    def create 
        hero_power = HeroPower.create!(prod_params)
        if hero_power
            render json: hero_power.hero, status: :created
        else
            render json: { error:hero_power.errors.full_messages},status: :unprocessable_entity
        end

    end

    private 

    def prod_params 
        params.permit(:strength,:power_id,:hero_id)
    end
end
