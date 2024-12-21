module MusicBrainz
  module Bindings
    module ArtistCredits
      def parse(xml)
        artist_credits = xml.xpath('./artist-credit/name-credit').map do |xml|
          artist = xml.xpath('./artist').first

          {
            id: artist.attribute("id").value,
            type: (artist.attribute("type").value rescue nil),
            type_id: (artist.attribute("type-id").value rescue nil),
            name: artist.xpath('./name').text,
          }
        end

        { artist_credits: artist_credits }
      end

      extend self
    end
  end
end
