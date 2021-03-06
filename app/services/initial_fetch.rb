# frozen_string_literal: true

class InitialFetch
  def self.call(query_id, page)
    response = ResponseRetriever.call(query_id, page)
    response['data'].each do |response|
      response = ResponseParser.call(response)
      result = Result.find_or_create_by(response) if response.fetch('date') > DateTime.now
      result.query_results.find_or_create_by(query_id: query_id)
    rescue StandardError
    end
  end
end
