class Lesson < ActiveRecord::Base
  belongs_to :section

  validates :title, :presence => true
  validates :subtitle, :presence => true
  mount_uploader :video, VideoUploader

  include RankedModel
  ranks :row_order, :with_same => :section_id

end
