json.array!(@votes) do |vote|
  json.extract! vote, :word_id, :coloer_id
  json.url vote_url(vote, format: :json)
end
