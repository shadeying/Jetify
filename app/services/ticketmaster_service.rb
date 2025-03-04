
TICKETMASTER_KEY=ENV['TICKETMASTER_KEY']


class TicketmasterService
  #this method makes a request to ticket master API using the ticketmaster-sdk wrapper
  
  class << self
    def call(latlong, startDate, endDate)
      params = { size: 15,  latlong: latlong,
        sort: 'date,asc',
        classificationId:'KZFzniwnSyZfZ7v7nJ', 
        startDateTime: startDate, 
        endDateTime: endDate,
        radius: 10,
        unit: 'miles'
        
      }
      client = Ticketmaster.client(apikey: TICKETMASTER_KEY)
      response = client.search_events(params: params)
      response.results.map{|result| event_hash(result).compact}
    end

    private
    def event_hash(result)
      date = result.dates['start']
      venue = result.venues.first
      image = result.images.first
      artist = result.attractions.first
      {
        id: result.id,
        image: image ? image.url : '',
        name: result.name, 
        date: date ? date['localDate'] : '',
        venue: venue ? venue.name : '',
        url: result.data['url'], 
        artist: artist ? artist.name : nil
      }
    end
  end
end

# call compact on array - if there is a nil/empty then it strips this out. 


# events = TicketmasterService.call('54.9713082,-2.7246093',
#  DateTime.parse('2019-07-05'), 
#  DateTime.parse('2019-07-20'))

