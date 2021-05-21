class ListsController < ApplicationController

    def index
        @lists = List.all
      end
    
     def show
       @list = List.find(params[:id])
      end
    
      def new
        @list = List.new
          end
        
          def create
            @list = List.new(list_params)
            if @list.save
            redirect_to list_path(@list)
            else
                render :new
            end
          end

 # def create
 #   @plant = Plant.new(plant_strong_params)
  #  @park = Park.find(params[:park_id])
  #  @plant.park = @park

 #   if @plant.save
 #     redirect_to park_path(@park)
  #  else
 #     render "parks/show"
  #  end


          private
        
          def list_params
            params.require(:list).permit(:name)
          end
end

