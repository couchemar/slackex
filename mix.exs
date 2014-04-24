defmodule Slackex.Mixfile do
  use Mix.Project

  def project do
    [app: :slackex,
     version: "0.0.1",
     elixir: "~> 0.13.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [ applications: [:httpoison],
      mod: [] ]
  end

  # List all dependencies in the format:
  #
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
     {:httpoison, github: "couchemar/httpoison", branch: "hackney-update"},
     {:jsex, github: "talentdeficit/jsex"}
    ]
  end
end
