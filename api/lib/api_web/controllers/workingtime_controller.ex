defmodule ApiWeb.WorkingtimeController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.Workingtime

  action_fallback ApiWeb.FallbackController

  def index(conn, params) do
    if Map.has_key?(params, "start") and Map.has_key?(params, "end") do
      workingtimes = TimeManager.list_workingtimes_by_params(Map.get(params, "userID"), Map.get(params, "start"), Map.get(params, "end"))
      if workingtimes != [] do 
        render(conn, "index.json", workingtimes: workingtimes)
      else
        send_resp(conn, 404, "Not found")
      end
    else 
      if Map.has_key?(params, "start") do
        workingtimes = TimeManager.list_workingtimes_by_start(Map.get(params, "userID"), Map.get(params, "start"))
        if workingtimes != [] do 
          render(conn, "index.json", workingtimes: workingtimes)
        else
          send_resp(conn, 404, "Not found")
        end
      else
        if Map.has_key?(params, "end") do
          workingtimes = TimeManager.list_workingtimes_by_end(Map.get(params, "userID"), Map.get(params, "end"))
          if workingtimes != [] do 
            render(conn, "index.json", workingtimes: workingtimes)
          else
            send_resp(conn, 404, "Not found")
          end
        else
          workingtimes = TimeManager.list_workingtimes(Map.get(params, "userID"))
          if workingtimes != [] do 
            render(conn, "index.json", workingtimes: workingtimes)
          else
            send_resp(conn, 404, "Not found")
          end
        end
      end
    end
  end


  def create(conn, %{"workingtime" => workingtime_params, "userID" => userID}) do
    with {:ok, %Workingtime{} = workingtime} <- TimeManager.create_workingtime(Map.merge(workingtime_params, %{"user" => userID})) do
      # TODO : Might change response here  
      data = Poison.encode!(%{"start" => workingtime.start, "end" => workingtime.end})
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(201, data)
    end
  end

  def show(conn, %{"userID" => userID, "id" => id}) do
    workingtime = TimeManager.list_workingtime(userID, id)
    if not is_nil(workingtime) do 
      # TODO : Might change response here        
      data = Poison.encode!(%{"start" => workingtime.start, "end" => workingtime.end})
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(201, data)
    else
      send_resp(conn, 404, "Not found")
    end
  end


  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = TimeManager.get_workingtime!(id)
    if not is_nil(workingtime) do 
      with {:ok, %Workingtime{} = workingtime} <- TimeManager.update_workingtime(workingtime, workingtime_params) do
        # TODO : Might change response here        
        data = Poison.encode!(%{"start" => workingtime.start, "end" => workingtime.end})
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, data)
      end
    else
      send_resp(conn, 404, "Not found")
    end
    
  end


  def delete(conn, %{"id" => id}) do
    workingtime = TimeManager.get_workingtime!(id)
    if not is_nil(workingtime) do 
      with {:ok, %Workingtime{}} <- TimeManager.delete_workingtime(workingtime) do
        send_resp(conn, :no_content, "")
      end
    else
      send_resp(conn, 404, "Not found")
    end
    
  end
end
