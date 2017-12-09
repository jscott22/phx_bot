defmodule UiWeb.GpioChannel do
  use UiWeb, :channel

  def join("gpio:control", payload, socket) do
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("drive:forward", payload, socket) do
    IO.puts("Forward!")
    {:reply, :ok, socket}
  end

  def handle_in("drive:backwards", payload, socket) do
    IO.puts("Backward!")
    {:reply, :ok, socket}
  end

  def handle_in("turn:left", payload, socket) do
    IO.puts("Left!")
    {:reply, :ok, socket}
  end

  def handle_in("turn:right",payload, socket) do
    IO.puts("Right!")
    {:reply, :ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (gpio:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
