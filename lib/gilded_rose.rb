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
        if item.quality < 50
          item.quality = item.quality + 1
        end
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.quality < 50
          item.quality = item.quality + 1
          
          if item.sell_in < 11
              item.quality = item.quality + 1
          end

          if item.sell_in < 6
              item.quality = item.quality + 1
          end
        end
      else
        if item.quality > 0
            item.quality = item.quality - 1

            if item.name == "Conjured"
              item.quality = item.quality - 1
            end
        end
      end

      item.sell_in = item.sell_in - 1

      if item.sell_in < 0
        if item.name == "Aged Brie"
          if item.quality < 50
            item.quality = item.quality + 1
          end
        elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
          item.quality = item.quality - item.quality
        else
          if item.quality > 0
            item.quality = item.quality - 1

            if item.name == "Conjured"
              item.quality = item.quality - 1
            end
          end
        end
      end
    end
  end
end