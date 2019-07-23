defmodule ElStore do
  use GenServer

  # API

  def start_link do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  #def set(key, value) do
  #  GenServer.cast(__MODULE__, {:set, key, value})
  #end

  def set(key, value) do
    GenServer.call(__MODULE__, {:set, key, value})
  end

  def delete(key) do
    GenServer.call(__MODULE__, {:delete, key})
  end

  def exists?(key) do
    GenServer.call(__MODULE__, {:exists?, key})
  end

  def flushall() do
    GenServer.call(__MODULE__, :flushall)
  end

  # Callbacks

  def init(map) do
    {:ok, map}
  end

  #def handle_cast({:set, key, value}, map) do
  #  map_new = Map.put(map, key, value)
  #  {:noreply, map_new}
  #end

  def handle_call({:set, key, value}, _from, map) do
    map_new = Map.put(map, key, value)
    {:reply, map_new, map_new}
  end

  def handle_call({:get, key}, _from, map) do
    value = Map.get(map, key)
    {:reply, value, map}
  end

  def handle_call({:delete, key}, _from, map) do
    map_new = Map.delete(map, key)
    {:reply, map_new, map_new}
  end

  def handle_call({:exists?, key}, _from, map) do
    value = Map.has_key?(map, key)
    {:reply, value, map}
  end

  def handle_call(:flushall, _from, _map) do
    {:reply, %{}, %{}}
  end
end
