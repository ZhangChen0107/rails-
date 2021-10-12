module DateModule extend ActiveSupport::Concern
   def DateModule.find_before_today
       return 'created_at < ?' , Date.today
   end
end