defmodule SSHPortfolio.StartPage do
  @behaviour Garnish.App
  import Garnish.View

  @impl true
  def init(_context) do
    {:ok, 0}
  end

  @impl true
  def handle_key(%{data: "i"}, model) do
    {:ok, model + 1}
  end

  def handle_key(%{data: "d"}, model) do
    {:ok, model - 1}
  end

  def handle_key(%{data: "q"}, model) do
    {:stop, model}
  end

  def handle_key(%{data: "\x1bOA\x1bOA\x1bOA"}, model) do
    {:ok, model + 1}
  end

  def handle_key(%{data: "\x1bOB\x1bOB\x1bOB"}, model) do
    {:ok, model - 1}
  end

  def handle_key(key, model) do
    dbg(key)
    {:ok, model}
  end

  @impl true
  def render(model) do
    menu_bar =
      bar do
        label(content: " [I]ncrease · [D]ecrease · [Q]uit")
      end

    view(bottom_bar: menu_bar) do
      # panel do
      #   label(
      #     content: ~S"""
      #      _   _ ___ ___ __  __ _  _____  ____  _____    _    _   _ ____
      #     | | | |_ _|_ _|  \/  | |/ / _ \| __ )| ____|  / \  | \ | |  _ \
      #     | |_| || | | || |\/| | ' / | | |  _ \|  _|   / _ \ |  \| | | | |
      #     |  _  || | | || |  | | . \ |_| | |_) | |___ / ___ \| |\  | |_| |
      #     |_| |_|___|___|_|  |_|_|\_\___/|____/|_____/_/   \_\_| \_|____/ 
      #     """
      #   )
      # end

      panel do
        label(
          content: ~S"""
          __    _  __     _               _              _
          \ \  | |/ /___ | |__   ___     / \   _ __   __| | ___ _ __ ___  ___ _ __
           \ \ | ' // _ \| '_ \ / _ \   / _ \ | '_ \ / _` |/ _ \ '__/ __|/ _ \ '_ \
           / / | . \ (_) | |_) |  __/  / ___ \| | | | (_| |  __/ |  \__ \  __/ | | |
          /_/  |_|\_\___/|_.__/ \___| /_/   \_\_| |_|\__,_|\___|_|  |___/\___|_| |_|
          """
        )
      end

      panel(title: "Profile") do
        label(content: "Occupation: Datamatiker (Computer Science) Student at UCL Odense")
        label(content: "Focus: Backend Development, Frontend Functionality and DevOps")
        label(content: "GitHub: https://github.com/HiImKobeAnd")
        label(content: "LinkedIn: https://linkedin.com/in/kobe-andersen")
        label(content: "Email: hiimkobeand@gmail.com")
      end

      panel(title: "Core Technologies") do
        label(content: "Languages: C#, Rust, Elixir, JavaScript")
        label(content: "DevOps: Docker, GitHub Actions")
        label(content: "Environments: Linux, NixOS, Self-Hosting")
      end

      panel(title: "Projects") do
        panel(title: "Time Tracker") do
          label(
            content:
              "Description: A project designed to easily count inventory items on a mobile device and automatically calculate how many units need to be ordered.",
            wrap: true
          )

          label(content: "Link: https://github.com/HiImKobeAnd/cosmic-ext-time-tracker")

          label(
            content: "Mirror: https://git.hiimkobeand.net/HiImKobeAnd/cosmic-ext-time-tracker"
          )
        end

        panel(title: "Restock List") do
          label(
            content:
              "Description: A project that adds a button to the taskbar to control a timer that integrates with various backends.",
            wrap: true
          )

          label(content: "Link: https://github.com/HiImKobeAnd/restock-list")
          label(content: "Mirror: https://git.hiimkobeand.net/HiImKobeAnd/restock-list")
        end

        panel(title: "NixOS Configuration") do
          label(
            content:
              "Description: A personal repository dedicated to configuring my NixOS installations. It manages everything from low-level system settings to daily desktop applications using the Nix package manager.",
            wrap: true
          )

          label(content: "Link: https://github.com/HiImKobeAnd/nixos")
          label(content: "Mirror: https://git.hiimkobeand.net/HiImKobeAnd/nixos")
        end
      end

      label(content: "Counter is #{model}")
    end
  end
end
