class ValveSweeper < ActionController::Caching::Sweeper
  observe Valve

  def after_create(record)
    expire_action(:controller => 'valves', :action => 'index')
  end

  def after_update(record)
    expire_action(:controller => 'valves', :action => 'index')
  end


  def after_destroy(record)
    expire_action(:controller => 'valves', :action => 'index')
  end
end

