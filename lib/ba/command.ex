defmodule Ba.Command do
  @prefix "?ba "

  def actionable?(message) do
    String.starts_with?(message.content, @prefix)
  end 

  def handle(message) do
    IO.puts message.content
  end
end