defmodule Slackex.API do
  use HTTPoison.Base
  def process_url(url) do
    "https://slack.com/api/" <> url
  end

  def process_response_body(body) do
    JSEX.decode! body, labels: :atom
  end
end

defmodule Slackex.Auth do
  def test(token) do
    query = [token: token] |> URI.encode_query
    uri = URI.Info.new(path: "auth.test", query: query)
    Slackex.API.get(uri |> to_string).body
  end
end

defmodule Slackex.Groups do
  def list(token) do
    query = [token: token] |> URI.encode_query
    uri = URI.Info.new(path: "groups.list", query: query)
    Slackex.API.get(uri |> to_string).body
  end

  def list(token, exclude_archived) do
    query = [token: token, exclude_archived: exclude_archived] |> URI.encode_query
    uri = URI.Info.new(path: "groups.list", query: query)
    Slackex.API.get(uri |> to_string).body
  end
end

defmodule Slackex.Chat do
  def post_message(token, channel, text, opts \\ []) do
    query = opts |> Dict.merge(channel: channel, token: token, text: text) |> URI.encode_query
    uri = URI.Info.new(path: "chat.postMessage", query: query)
    Slackex.API.get(uri |> to_string).body
  end
end