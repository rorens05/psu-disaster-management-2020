class Message < ApplicationRecord
  require 'json'

  belongs_to :student
  enum message_type: ['Reqular Message', 'SOS']

  def location
    return nil unless json?(content)

    content_json = JSON.parse(content)
    result = Geocoder.search([content_json['latitude'], content_json['longitude']])
    return nil unless result.length.positive?

    result.first
  end

  def latitude
    return nil unless json?(content)

    content_json = JSON.parse(content)
    content_json['latitude']
  end

  def longitude
    return nil unless json?(content)

    content_json = JSON.parse(content)
    content_json['longitude']
  end

  private

  def json?(content)
    JSON.parse(content)
    true
  rescue JSON::ParserError => e
    false
  end
end
