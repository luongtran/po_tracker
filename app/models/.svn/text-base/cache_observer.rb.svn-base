class CacheObserver < ActiveRecord::Observer
  observe :piping_class ,:valve

  #Also we need to invalidate cache on any related models of PipingClass changes(creates newly)

  def after_save(record)
    #delete cache for PipingClass
    Rails.cache.delete("#{record.class.name}_all_cache")
    Rails.cache.delete("#{record.class.name}_sext_cache")
  end

  def after_destroy(record)
    #delete cache for PipingClass
    Rails.cache.delete("#{record.class.name}_all_cache")
    Rails.cache.delete("#{record.class.name}_sext_cache")
  end

end