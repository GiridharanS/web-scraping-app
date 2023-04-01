# frozen_string_literal: true

class RestaurantsScraper < Kimurai::Base
  @name = 'restaurants_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    crawl!
  end

  def parse(response, url:, data: {})
    breadcrumbs_array = response.css('ol.breadcrumbs li a')&.map(&:text)
    location = Location.find_or_create_by(country: breadcrumbs_array[1], state: breadcrumbs_array[2],
                                          city: breadcrumbs_array[3])

    restaurant_name = response.css('section.merchant-name h1').text.squish
    restaurant_type = response.css('section.merchant-name p').children[0].text.squish
    restaurant_description = response.css('section.merchant-description').text.squish

    restaurant = location.restaurants.find_or_create_by(name: restaurant_name, restaurant_type: restaurant_type,
                                                        description: restaurant_description)

    response.css('article.categoryListing').each do |category|
      category_name = category.css('h4.categoryHeading').text.squish
      category_item = restaurant.categories.find_or_create_by(name: category_name)

      category.css('section.categoryItemHolder').each do |product|
        item = {}
        item[:name] = product.css('article.itemInfo a.itemName').text.squish
        item[:price] = product.css('article.itemInfo span.itemPrice').text.squish.gsub('₹', '')
        item[:image_url] = product.css('span.itemImageHolder img.itemImage').attr('src').to_s
        item[:description] = product.css('article.itemInfo section.description').text.squish
        category_item.products.find_or_create_by(item)
      end
    end
  end
end
