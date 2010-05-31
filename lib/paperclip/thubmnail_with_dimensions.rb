module Paperclip
  class ThumbnailWithDimensions < Thumbnail
    def initialize(file, options = {}, attachment = nil)
      super
      attachment.instance_write(:width, @current_geometry.width)
      attachment.instance_write(:height,@current_geometry.height)
    end
  end
end