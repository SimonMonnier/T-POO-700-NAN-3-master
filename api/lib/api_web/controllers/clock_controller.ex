defmodule ApiWeb.ClockController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.Clock
  alias Api.TimeManager.Workingtime

  action_fallback ApiWeb.FallbackController

  def create(conn, %{"userID" => userID}) do
    clock = TimeManager.get_clock!(userID)
    if is_nil(clock) do 
      with {:ok, %Clock{} = clock} <- TimeManager.create_clock(%{"user" => userID, "status" => true, "time" => DateTime.utc_now()}) do 
        data = Poison.encode!(%{"time" => clock.time, "status" => clock.status})
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, data)
      end
    else
      if clock.status do
        clock = TimeManager.get_clock!(clock.user)
        with {:ok, %Workingtime{} = _workingtime} <- TimeManager.create_workingtime(%{"start" => clock.time, "end" => DateTime.utc_now(), "user" => clock.user}) do
          conn
          |> put_status(:created)
        end
        clock_params = %{"status" => false , "time" => DateTime.utc_now()}
        with {:ok, %Clock{} = clock} <- TimeManager.update_clock(clock, clock_params) do
          data = Poison.encode!(%{"time" => clock.time, "status" => clock.status})
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(201, data)
        end
      else
        clock_params = %{"status" => true, "time" => DateTime.utc_now()}
        with {:ok, %Clock{} = clock} <- TimeManager.update_clock(clock, clock_params) do
          data = Poison.encode!(%{"time" => clock.time, "status" => clock.status})
          conn
          |> put_resp_content_type("application/json")
          |> send_resp(201, data)
        end
      end
    end
  end

  def show(conn, %{"userID" => id}) do
    clock = TimeManager.get_clock!(id)
    if not is_nil(clock) do 
      # TODO : Might change response here        
      data = Poison.encode!(%{"time" => clock.time, "status" => clock.status})
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, data)
    else
      send_resp(conn, 404, "Not found")
    end
  end

end
