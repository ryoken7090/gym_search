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
  validates :monthly_fee, format: {with: /\A\d{4,6}\z/}, allow_blank: true

  def avg_score(category)
    unless self.reviews.empty?
      reviews.average(category).round(1).to_f
    else
      0.0
    end
  end

  def avg_score_percentage(category)
    avg_score(category)*100/5
  end

  def self.names_keys(item)
    send(item.pluralize).keys.map {|k| [I18n.t("enums.facility.#{item}.#{k}"), k]}
  end


  scope :search_all_tags, -> (*tag_ids) {
    where(id: Tagging.select(:facility_id).where(tag_id: tag_ids).group(:facility_id).having("COUNT(DISTINCT taggings.tag_id) = ?", tag_ids.size - 1))
  }

  def self.ransackable_scopes(auth_object = nil)
    %i[search_all_tags]
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

end
