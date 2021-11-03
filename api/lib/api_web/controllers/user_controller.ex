defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  alias Api.TimeManager
  alias Api.TimeManager.User

  action_fallback ApiWeb.FallbackController

  def index(conn, params) do
    if Map.has_key?(params, "username") and Map.has_key?(params, "email") do
      users = TimeManager.list_users_by_params(Map.get(params, "username"), Map.get(params, "email"))
      if users != [] do 
        render(conn, "index.json", users: users)
      else
        send_resp(conn, 404, "Not found")
      end
    else 
      if Map.has_key?(params, "username") do
        users = TimeManager.list_users_by_username(Map.get(params, "username"))
        if users != [] do 
          render(conn, "index.json", users: users)
        else
          send_resp(conn, 404, "Not found")
        end
      else
        if Map.has_key?(params, "email") do
          users = TimeManager.list_users_by_email(Map.get(params, "email"))
          if users != [] do 
            render(conn, "index.json", users: users)
          else
            send_resp(conn, 404, "Not found")
          end
        else
          users = TimeManager.list_users()
          if users != [] do 
            render(conn, "index.json", users: users)
          else
            send_resp(conn, 404, "Not found")
          end
        end
      end
    end
  end

  def show(conn, %{"userID" => id}) do
    user = TimeManager.get_user!(id)
    if not is_nil(user) do 
      # TODO : Might change response here        
      data = Poison.encode!(%{"username" => user.username, "email" => user.email})
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, data)
    else
      send_resp(conn, 404, "Not found")
    end
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- TimeManager.create_user(user_params) do
      # TODO : Might change response here        
      data = Poison.encode!(%{"id" => user.id, "username" => user.username, "email" => user.email})
      conn
      |> put_resp_content_type("application/json")
      |> send_resp(201, data)
    end
  end

  def update(conn, %{"userID" => id, "user" => user_params}) do
    user = TimeManager.get_user!(id)
    if not is_nil(user) do 
      with {:ok, %User{} = user} <- TimeManager.update_user(user, user_params) do
        # TODO : Might change response here        
        data = Poison.encode!(%{"username" => user.username, "email" => user.email})
        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, data)
      end
    else
      send_resp(conn, 404, "Not found")
    end
  end

  def delete(conn, %{"userID" => id}) do
    user = TimeManager.get_user!(id)
    if not is_nil(user) do 
      with {:ok, %User{}} <- TimeManager.delete_user(user) do
        send_resp(conn, :no_content, "")
      end
    else
      send_resp(conn, 404, "Not found")
    end
  end
end
