FROM elixir:latest

COPY . /app
WORKDIR /app

RUN apt-get update && apt-get install -y postgresql

RUN mix local.hex --force && mix local.rebar --force

CMD mix ecto.create && mix ecto.migrate && mix ecto.migrate && mix phx.server