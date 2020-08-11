class Facility < ApplicationRecord
  enum drop: {
     unknown_drop: 0,
     possible_drop: 1,
     accept_drop: 2,
     fail_drop: 3
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