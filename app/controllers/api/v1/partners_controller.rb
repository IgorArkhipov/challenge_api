# frozen_string_literal: true

module Api
  module V1
    class PartnersController < ApplicationController
      before_action :authorized?

      def index
        render json: Partner.all
      end

      def show
        render json: Partner.find_by(id: params[:id])
      end

      def match
        # here we could optionally track customer data
        # based on the phone number from the request params
        # and save it to an external service like MixPanel
        render json: matched_partners, status: :ok
      end

      private

      def match_params
        params.require(:requirements).permit(:latitude, :longitude, :square_size, :phone_number, material: [])
      end

      def matched_partners
        requirement = Requirement.new(
          material: match_params[:material].uniq,
          latitude: match_params[:latitude].to_d,
          longitude: match_params[:longitude].to_d
        )
        return {} unless requirement.valid?

        Partner.joins(material_relations: :material)
               .where(materials: { name: requirement.material }).distinct
               .in_area(requirement.latitude, requirement.longitude)
               .order(rating: :desc)
      end
    end
  end
end
