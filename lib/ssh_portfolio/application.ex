defmodule SSHPortfolio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    opts = [
      system_dir: ~c"./priv/ssh_keys",
      ssh_cli: {Garnish, app: SSHPortfolio.StartPage},
      no_auth_needed: true,
      pwdfun: fn _user, _password -> true end
    ]

    {:ok, ref} = :ssh.daemon({127, 0, 0, 1}, 2222, opts)

    children = []

    opts = [strategy: :one_for_one, name: SSHPortfolio.Supervisor]

    with {:ok, pid} <- Supervisor.start_link(children, opts) do
      {:ok, pid, ref}
    end
  end

  @impl true
  def stop(ref) do
    :ssh.stop_daemon(ref)
  end
end
