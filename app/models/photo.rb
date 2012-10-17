class Photo < ActiveRecord::Base
  belongs_to :gallery
  
  has_attached_file :file,
  :styles => {
    :thumb => "100x100#",
    :tiny => '50x38#'
  }
end
