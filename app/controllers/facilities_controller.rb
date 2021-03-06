class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :confirm,  :edit, :update, :destroy]
  def index
    @q = Facility.ransack(params[:q])
    @facilities = Facility.all
    @cities = City.all
    @tags = Tag.all
    @facilities = @q.result(distinct: true)
  end

  def search
    @q = Facility.search(search_params)
    @facilities = @q.result(distinct: true).page(params[:page]).per(10)
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

  # def confirm
  #   @facility = Facility.new(facility_params)
  #   @facility.poster_id = current_user.id
  #   render :new if @facility.invalid?
  # end

  def show
    @equipment_keys = Equipment.names.keys
    @equipments = @facility.equipments
    @reviews = Review.where(facility_id: @facility.id)
    @review = @facility.reviews.build
    if user_signed_in?
      @favorite = current_user.favorites.find_by(facility_id: @facility.id)
    end
  end


  def edit
    @previous_inputs = @facility.equipments.map {|amounts| amounts[:amount]}
    @facility.equipments.delete_all
    @facility.equipments.build
  end

  def update
    if @facility.update(facility_params)
      Rails.logger.level = 0
      logger.debug "施設情報が編集されました"
      logger.debug "編集者のid: #{current_user.id} 編集された施設のid: #{@facility.id}"
      redirect_to facility_path(@facility.id), notice: "施設情報を編集しました"
    else
      @previous_inputs = @facility.equipments.map {|amounts| amounts[:amount]}
      @facility.equipments.delete_all
      @facility.equipments.build
      render :edit
    end
  end

  def destroy
    if current_user.admin? || current_user == @facility.poster
      @facility.destroy
      redirect_to facilities_path, notice: "施設情報を削除しました"
    else
      flash.now[:alert] = "投稿者と管理者のみ削除できます"
      render :index
    end
  end

  def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com', name: 'ゲストユーザー') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
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

  def search_params
    params.require(:q).permit(:name_cont,
                              :drop_gteq,
                              :parking_eq,
                              :shower_eq,
                              :recordable_eq,
                              :visiter_eq,
                              :accessible_ten_min_eq,
                              :trainer_eq,
                              :open_all_time_eq,
                              :monthly_fee_lteq,
                              city_id_in: [],
                              search_all_tags: [],
                              search_equipments: [:amount, :name])
  end
end
