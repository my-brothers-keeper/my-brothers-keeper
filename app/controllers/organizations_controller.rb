class OrganizationsController < ApplicationController
  def index
    features = Organization.all().map { |org| RGeo::GeoJSON::Feature.new org.location, id = org.id, properties = { "name" => org.name } }
    collection = RGeo::GeoJSON::FeatureCollection.new features
    render json: RGeo::GeoJSON.encode(collection)
  end

  def show
    @organization = Organization.find(params[:id])
    render layout: false
  end
end
