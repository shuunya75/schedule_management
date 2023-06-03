class Schedule < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validates :title, length: {maximum: 20}
  validates :content, length: {maximum: 500}
  validate :start_end_check

  def start_end_check
    if self.start_date == nil || self.end_date == nil
    elsif self.start_date > self.end_date
      errors.add(:end_date, "は開始日以降の日付で選択してください。")
    end
  end

  def is_all_day?
    "○" if is_all_day == true
  end
end
