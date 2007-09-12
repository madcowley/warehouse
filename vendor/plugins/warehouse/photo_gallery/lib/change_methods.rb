module ChangeMethods
  include_into "Change"
  CHANGE_SCOPE = {:find => {:conditions => ['path LIKE ? OR path LIKE ? OR path LIKE ?', '%.jpg', '%.gif', '%.png'], :order => 'id desc', :group => 'path', :limit => 15}}
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def find_recent_photos(*args)
      with_scope(CHANGE_SCOPE) { paginate *args }
    end
  end
end