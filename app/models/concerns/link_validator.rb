require 'addressable/uri'

class LinkValidator < ActiveModel::Validator
  def validate(record)
    begin
      uri = parsed_uri(record.link) 

      if unaccepted_protocols(uri.scheme) ||
          unaccepted_domains(uri.host)
        raise Addressable::URI::InvalidURIError
      end
    rescue Addressable::URI::InvalidURIError
      record.errors.add(:link, "must be a valid IMDB link")
    end
  end

  private

  def parsed_uri(value)
    Addressable::URI.parse(value)
  end

  def unaccepted_protocols(scheme)
    !["http", "https"].include?(scheme)
  end

  def unaccepted_domains(host)
    # m.imdb.com for mobile
    !["www.imdb.com", "m.imdb.com", "imdb.com"].include?(host)
  end
end
