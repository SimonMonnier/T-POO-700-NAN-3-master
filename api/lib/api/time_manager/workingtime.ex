defmodule Api.TimeManager.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :naive_datetime, null: false
    field :start, :naive_datetime, null: false
    field :user, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:start, :end, :user])
    |> validate_required([:start, :end, :user])
    |> foreign_key_constraint(:user)
  end
end
