# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_selects, only: %i[create new edit update]
  before_action :set_property, except: %i[index]

  def index
    @properties = Property.all
  end

  def show
    @property
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new
    end
  end

  def edit
    @property
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @property.destroy
  end

  def area_autocomplete
    render json: PlacesAutocompleteService.new(params[:query]).call.map { |x|
      { result: "#{x['mainText']}, #{x['secondaryText']}",
        place_id: x['placeId'] }
    }
  end

  private

  def set_property
    @property = Property.find_by_id(params[:id])
    return if @property.present?

    respond_to do |type|
      type.html { render template: 'layouts/404', status: 404 }
    end
  end

  def set_selects
    @property_transaction = Property::TRANSACTION.map { |x| { id: x.capitalize, name: x } }
    @property_types = Property::TYPES.map { |x| { id: x.capitalize, name: x } }
  end

  def property_params
    params.require(:property).permit(:title, :property_transaction, :property_type, :levels, :bathrooms,
                                     :area, :price, :description, :place_id)
  end
end
