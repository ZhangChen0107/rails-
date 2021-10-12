class Article < ApplicationRecord
  include AttrModule
  include DateModule

  attr_accessor :overwrite_updated_at 
  
  has_many :comments, dependent: :destroy

  before_save :reset_updated_at

  validates :title, presence: {message:'title不能为空'},
                    length: {minimum: 1,maximum: 4}

  def self.find_yesterday
    #where('created_at < ?', Date.today)
    where(DateModule.find_before_today)
  end

  def self.delete_if_text_is_nil
    destroy_by(text: nil)
  end

  def updated_at_term
    updated_at.strftime("%Y年%m月%d日 %H点%M分")
  end

  def change_update_at_to_current_time
    update(updated_at: DateTime.current)  
  end

  private
  def reset_updated_at
    self.updated_at = AttrModule.reset_before_by_after(self.updated_at,self.overwrite_updated_at)
  end

end