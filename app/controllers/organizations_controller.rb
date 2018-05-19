# frozen_string_literal: true

# Controller for serving organization GeoJSON and side-bar HTML content
class OrganizationsController < ApplicationController

  def index
    collection = RGeo::GeoJSON::FeatureCollection.new(
      Organization.all.map do |org|
        RGeo::GeoJSON::Feature.new(
          org.location, org.id, name: org.name, need_count: org.needs.count
        )
      end
    )
    render json: RGeo::GeoJSON.encode(collection)
  end

  def show
    @organization = Organization.find(params[:id])
    @needs = @organization.needs.order(:item).includes(:category)
    render layout: false
  end
end
