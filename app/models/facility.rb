class Facility < ApplicationRecord
  belongs_to :city
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  accepts_nested_attributes_for :taggings, allow_destroy: true
  belongs_to :poster, class_name: 'User', foreign_key: 'poster_id'
  has_many :reviews, dependent: :destroy
  has_many :equipments, dependent: :destroy
  accepts_nested_attributes_for :equipments

  validates :name, uniqueness: true
  validates :name, length: { in: 1..30 }
  validates :tell, format: {with: /\A0\d{1,3}[-(]\d{1,4}[-)]\d{4}\z/}, allow_blank: true
  validate :current_price

  def avg_score(category)
    unless self.reviews.average(category).blank?
      reviews.average(category).round(1).to_f
    else
      0.0
    end
  end

  def avg_score_percentage(category)
    avg_score(category)*100/5
  end


  def visiter_symbol
    if self.visiter == "allow_visiter"
      "◎"
    elsif self.visiter == "not_allow_visiter"
      "×"
    else
      "-"
    end
  end

  def accessible_ten_min_symbol
    if self.accessible_ten_min == "accessible"
      "◎"
    elsif self.accessible_ten_min == "not_accessible"
      "×"
    else
      "-"
    end
  end

  def open_all_time_symbol
    if self.open_all_time == "yes_open_all_time"
      "◎"
    elsif self.open_all_time == "not_open_all_time"
      "×"
    else
      "-"
    end
  end



  def self.names_keys(item)
    send(item.pluralize).keys.map {|k| [I18n.t("enums.facility.#{item}.#{k}"), k]}
  end


  scope :search_all_tags, -> (*tag_ids) {
    where(id: Tagging.select(:facility_id).where(tag_id: tag_ids).group(:facility_id).having("COUNT(DISTINCT taggings.tag_id) = ?", tag_ids.size - 1))
  }

  scope :search_equipments, -> (*equipments) {
    # max_input_number = 20
    # equipments = equipments.delete_if{|equipment| equipment[:amount].empty?}
    #
    # where(id: Equipment.select(:facility_id).where("amount: ? and name = ? ", equipments[0][:amount].to_i..max_input_number, equipments[0][:name])
    # .or(Equipment.where("amount: ? and name = ? ", equipments[1][:amount].to_i..max_input_number, equipment[1][:name]))
    # .or(Equipment.where("amount: ? and name = ? ", equipments[2][:amount].to_i..max_input_number, equipment[2][:name]))
    # .or(Equipment.where("amount: ? and name = ? ", equipments[3][:amount].to_i..max_input_number, equipment[3][:name]))
    #
    # ....
    # .group(:facility_id).having("COUNT(DISTINCT equipments.name) = ?", equipments.size))
  }

  def self.ransackable_scopes(auth_object = nil)
    %i[search_all_tags search_equipments]
  end


  enum drop: {
     unknown_drop: 0,
     fail_drop: 1,
     accept_drop: 2,
     possible_drop: 3
   }

  enum parking: {
    unknown_parking: 0,
    available_parking: 1,
    not_available_parking: 2
  }
  enum shower: {
    unknown_shower: 0,
    available_shower: 1,
    not_available_shower: 2
  }

  enum recordable: {
    unknown_record: 0,
    allow_record: 1,
    not_allow_record: 2
  }

  enum visiter: {
    unknown_visiter: 0,
    allow_visiter: 1,
    not_allow_visiter: 2
  }

  enum accessible_ten_min: {
    unknown_accessible: 0,
    accessible: 1,
    not_accessible: 2
  }

  enum trainer: {
    unknown_trainer: 0,
    available_trainer: 1,
    not_available_trainer: 2
  }

  enum open_all_time: {
    unknown_open_all_time: 0,
    yes_open_all_time: 1,
    not_open_all_time: 2
  }

  private

  def current_price
    if monthly_fee.present?
      if monthly_fee < 1000
        errors.add(:monthly_fee, "月会費は1000円以上で登録してください")
      elsif monthly_fee > 100000
        errors.add(:monthly_fee, "月会費の値が大きすぎます")
      end
    end
  end

end
