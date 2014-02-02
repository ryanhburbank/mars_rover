class North
  def right
  	East.new
  end

  def left
  	West.new
  end
end

class East
  def right
    South.new
  end

  def left
    North.new
  end
end

class South
  def right
    West.new
  end

  def left
    East.new
  end
end

class West
  def right
    North.new
  end

  def left
    South.new
  end
end