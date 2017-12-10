defmodule Ui.GpioControl do

  use Agent

  alias ElixirALE.GPIO

  @pins [
    {:left_forward, 7},
    {:left_backward, 8},
    {:right_forward, 10},
    {:right_backward, 9}
  ]

  @forward [:left_forward, :right_forward]
  @backward [:left_backward, :right_backward]
  @right [:left_forward, :right_backward]
  @left [:right_forward, :left_backward]

  def start_link() do
    IO.puts("starting")
    Agent.start_link(fn -> start_pins() end, name: __MODULE__)
  end

  def start_pins() do
    pin_list = for {control, pin_num} <- @pins, into: %{} do
      {control, init_pin(pin_num)}
    end
    IO.inspect(pin_list)
    pin_list
  end

  def init_pin(pin_num) do
    # spawn(fn -> end)
    {:ok, pid} = GPIO.start_link(pin_num, :output)
    pid
  end

  #### DRIVE
  
  def handle_drive("forward"), do: Enum.each(@forward, &send_start/1)

  def handle_drive("backwards"), do: Enum.each(@backward, &send_start/1)

  def handle_drive("left"), do: Enum.each(@left, &send_start/1)

  def handle_drive("right"), do: Enum.each(@right, &send_start/1)

  def send_start(control_name) do
    IO.inspect("Starting")
    Agent.get(__MODULE__, fn pid_map->
      pid_map[control_name]
    end)
    |> GPIO.write(1)
  end

  #### STOP

  def handle_stop("forward"), do: Enum.each(@forward, &send_stop/1)
  
  def handle_stop("backwards"), do: Enum.each(@backward, &send_stop/1)

  def handle_stop("left"), do: Enum.each(@left, &send_stop/1)

  def handle_stop("right"), do: Enum.each(@right, &send_stop/1)

  def send_stop(control_name) do
    IO.inspect("Stopping")
    Agent.get(__MODULE__, fn pid_map->
      pid_map[control_name]
    end)
    |> GPIO.write(0)
  end

end