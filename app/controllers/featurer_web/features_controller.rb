module FeaturerWeb
  class FeaturesController < ApplicationController
    def index
      render locals: { collection: Feature.all }
    end

    def new
      render locals: { feature: Feature.new }
    end

    def edit
      render locals: { feature: Feature.by_name(params[:id]) }
    end

    def update
      update_and_redirect
    end

    def create
      update_and_redirect
    end

    def destroy
      Featurer.delete(params[:id])

      head 200
    end

    private

    def update_and_redirect
      Feature.update(params[:name], params[:matching_values])

      redirect_to root_path
    end
  end
end
