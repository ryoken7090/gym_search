class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :confirm,  :edit, :update, :destroy]
  def index
    @facilities = Facility.all
  end

  def new
    @facility = Facility.new
      @facility.equipments.build
      @previous_inputs = []
  end

  def create
    @facility = Facility.new(facility_params)
    @facility.poster_id = current_user.id
    if params[:back]
      render :new
    else
      if @facility.save
        redirect_to facility_path(@facility.id), notice: "施設情報を作成しました"
      else
        @previous_inputs = @facility.equipments.map {|amounts| amounts[:amount]}
        @facility.equipments.delete_all
        @facility.equipments.build
        render :new
      end
    end
  end

  def confirm
    @facility = Facility.new(facility_params)
    @facility.poster_id = current_user.id
    render :new if @facility.invalid?
  end

  def show
    @equipment_keys = Equipment.names.keys
    @equipments = @facility.equipments
  end


  def edit
  end

  def update
    if @facility.update(facility_params)
      redirect_to facility_path(@facility.id), notice: "施設情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @facility.destroy
    redirect_to facilities_path, notice: "施設情報を削除しました"
  end

  private
  def set_facility
    @facility = Facility.find(params[:id])
  end
  def facility_params
    params.require(:facility).permit(
                                    :name,
                                    :city_id,
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
                                    :description,
                                    tag_ids: [],
                                    equipments_attributes: [:amount, :name])
  end
end
