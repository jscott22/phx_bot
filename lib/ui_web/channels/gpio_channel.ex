defmodule UiWeb.GpioChannel do
  use UiWeb, :channel

  alias Ui.GpioControl

  def join("gpio:control", _payload, socket) do
    {:ok, socket}
  end

  ### DRIVE

  def handle_in("drive:" <> direction, _payload, socket) do
    IO.puts("Drive #{direction}!!")
    GpioControl.handle_drive(direction)
    {:reply, :ok, socket}
  end

  ## STOP

  def handle_in("stop:" <> direction, _payload, socket) do
    IO.puts("Stop #{direction}!!")
    GpioControl.handle_stop(direction)
    {:reply, :ok, socket}
  end

  # Add authorization logic here as required.
  # defp authorized?(_payload) do
  #   true
  # end
end
