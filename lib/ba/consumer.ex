defmodule Ba.Consumer do
  use Nostrum.Consumer
  alias Nostrum.Api
  alias Ba.Command

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, {message}, _ws_state}) do
    if Command.actionable? message do
      Command.handle message
    else
      react message
    end
  end

  def handle_event(_event) do
    :noop
  end

  def react(message) do
    if Regex.match? ~r/\bba+\b/, message.content do
      Api.create_reaction(message.channel_id, message.id, "\xF0\x9F\x90\x91")
    end
  end
end