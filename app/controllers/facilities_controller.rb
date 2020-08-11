class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to facilities_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @facility = Facility.find(params[:id])
  end
  def facility_params
    params.require(:facility).permit(
                                    :name,
                                    :drop,
                                    :parking,
                                    :shower,
                                    :recordable,
                                    :visiter,
                                    :monthly_fee,
                                    :accessible_ten_min,
                                    :trainer,
                                    :open_all_time,
                                    :station,
                                    :description_station,
                                    :address,
                                    :tell,
                                    :hp_url,
                                    :regular_holiday,
                                    :business_hours,
                                    :description)
  end
end
