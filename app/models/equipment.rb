class Equipment < ApplicationRecord
  self.table_name = 'equipments'
  belongs_to :facility

  enum name: {
     bench_press: 0,
     power_rack: 1,
     flat_bench: 2,
     adjustable_bench: 3,
     smith_machine: 4,
     cable_pulley: 5
   }

end
