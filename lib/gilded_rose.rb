class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Sulfuras, Hand of Ragnaros"
        return
      end

      if item.name == "Aged Brie"
        item = update_quality_aged_brie(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        item = update_quality_backstage_passes(item)
      elsif item.name == "Conjured"
        item = update_quality_conjured(item)
      else
        item = update_quality_normal(item)
      end
    end
  end

  private def update_quality_aged_brie(item)
    if item.quality < 50
      item.quality = item.quality + 1

      item = decrease_sell_in(item)

      if item.sell_in < 0
        if item.quality < 50
          item.quality = item.quality + 1
        end
      end
    end

    return item
  end

  private def update_quality_backstage_passes(item)
    if item.quality < 50
      item.quality = item.quality + 1
      
      if item.sell_in < 11
          item.quality = item.quality + 1
      end

      if item.sell_in < 6
          item.quality = item.quality + 1
      end
    end

    item = decrease_sell_in(item)

    if item.sell_in < 0
      item.quality = item.quality - item.quality
    end

    return item
  end

  private def update_quality_conjured(item)
    if item.quality >= 2
      item.quality = item.quality - 2
    end

    item = decrease_sell_in(item)

    if item.sell_in < 0
      if item.quality >= 2
        item.quality = item.quality - 2
      end
    end

    return item
  end  

  private def update_quality_normal(item)
    if item.quality > 0
      item.quality = item.quality - 1
    end

    item = decrease_sell_in(item)

    if item.sell_in < 0
      if item.quality > 0
        item.quality = item.quality - 1
      end
    end

    return item
  end

  private def decrease_sell_in(item)
    item.sell_in = item.sell_in - 1

    return item
  end
end