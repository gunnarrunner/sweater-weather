class UnsplashFacade
  def self.background(location_params)
    service = UnsplashService.get_photo(location_params)
    
    Photo.new(service[:results][0])
  end
end