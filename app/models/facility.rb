class Facility < ApplicationRecord
  enum drop: {
     unknown: 0,
     possible: 1,
     accepted: 2,
     fail: 3
   }
  enum parking: {
    unknown: 0,
    available: 1,
    not_available: 2
  }
  enum shower: {
    unknown: 0,
    available: 1,
    not_available: 2
  }

  enum record: {
    unknown: 0,
    available: 1,
    not_available: 2
  }

  enum visiter: {
    unknown: 0,
    available: 1,
    not_available: 2
  }

  enum accessible_ten_min: {
    unknown: 0,
    available: 1,
    not_available: 2
  }

  enum trainer: {
    unknown: 0,
    available: 1,
    not_available: 2
  }

  enum open_all_time: {
    unknown: 0,
    available: 1,
    not_available: 2
  }



end
