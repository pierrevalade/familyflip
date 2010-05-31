module MessagesHelper
  
  def pages(i, images)
    if i == 0
      true
    else
      if images[i].vertical?
        true
      else
        if images[i-1].vertical?
          true
        else
          false
        end
      end
    end
  end
  
end
