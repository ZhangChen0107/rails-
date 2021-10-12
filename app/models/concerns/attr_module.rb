module AttrModule extend ActiveSupport::Concern
  #def AttrModule.return_if_by_exist(a)
  #   return a if a
  #end

  def AttrModule.reset_before_by_after(a,b)
      a = b if b
      return a
  end
end