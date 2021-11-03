defmodule Api.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :naive_datetime, null: false
      add :end, :naive_datetime, null: false
      add :user, references(:users, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:workingtimes, [:user])
  end
end
