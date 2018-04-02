defmodule ElixirTips.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias ElixirTips.Accounts.Encryption

  schema "users" do
    field(:avatar, :string, default: "")
    field(:email, :string)
    field(:password_hash, :string)
    field(:potions, :integer, default: 0)
    field(:username, :string)
    ## Virtual Fields ##
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :avatar, :potions])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> validate_length(:password, min: 6)
    |> validate_length(:username, min: 3)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> downcase_email
    |> encrypt_password
  end

  defp downcase_email(changeset) do
    update_change(changeset, :email, &String.downcase/1)
  end

  defp encrypt_password(changeset) do
    password = get_change(changeset, :password)

    if password do
      encrypted_password = Encryption.hash_password(password)
      put_change(changeset, :password_hash, encrypted_password)
    else
      changeset
    end
  end
end
