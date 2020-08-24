class Equipment < ApplicationRecord
  self.table_name = 'equipments'
  belongs_to :facility
  validates :amount, numericality: { greater_than_or_equal_to: 0}, allow_blank: true

  enum name: {
     bench_press: 0,
     power_rack: 1,
     flat_bench: 2,
     adjustable_bench: 3,
     smith_machine: 4,
     cable_pulley: 5
   }

end
