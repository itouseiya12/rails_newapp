class Schedule < ApplicationRecord
  validates :title,presence: true,length: {maximum: 20}
  validates :starting_date,presence: true
  validates :ending_date,presence: true
  validates :memo,length: {maximum: 500}
  
  validate :start_end_check
  

    def start_end_check
      if ending_date.blank? || starting_date.blank?
        errors.add(:end_date, "は開始日より前の日付は登録できません。") 
      elsif self.ending_date < self.starting_date
       errors.add(:end_date, "は開始日より前の日付は登録できません。") 
      end
    end

    

end
