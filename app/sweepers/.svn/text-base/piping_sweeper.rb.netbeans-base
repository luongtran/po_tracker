class PipingSweeper < ActionController::Caching::Sweeper
  observe PipingClass

  def after_create(record)
    expire_action(:controller => 'piping', :action => 'index')
  end

  def after_update(record)
    expire_action(:controller => 'piping', :action => 'index')
  end


  def after_destroy(record)
    expire_action(:controller => 'piping', :action => 'index')
  end
end

