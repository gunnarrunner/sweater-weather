class UnsplashSerializer
  include FastJsonapi::ObjectSerializer
  
  def self.photo_information(photo_info)
    {
  data: {
    type: "image",
    id: nil,
    attributes: {
      image: {
        location: photo_info.description,
        image_url: photo_info.photo,
        credit: {
          source: photo_info.source,
          author: photo_info.photographer_name,
          author_profile: photo_info.photographer_profile,
        }
      }
    }
  }
}
  end
end