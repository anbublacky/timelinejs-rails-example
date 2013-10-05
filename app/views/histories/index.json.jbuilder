json.array!(@histories) do |history|
  json.extract! history, :startdate, :enddate, :content, :headline, :media, :mediacaption, :mediacredit
  json.url history_url(history, format: :json)
end
