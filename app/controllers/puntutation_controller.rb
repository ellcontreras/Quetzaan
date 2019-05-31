class PuntutationController < ApplicationController
    def create
        @puntuation = Puntutation.new(puntuation_params)

        @puntuation.puntutation = params[:puntutation][:puntutation].to_i

        puts @puntuation

        @puntuation.user_id = current_user.id

        respond_to do |format|
            if @puntuation.save
                format.json { head :no_content }
            end
        end
    end

    private
        def puntuation_params
            params.require(:puntutation).permit(:comment, :puntutation, :checkout_id)
        end
end
