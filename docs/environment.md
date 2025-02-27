# 🌁 Environment

## Our Development Environment
- Ubuntu LTS (WSL)
- Visual Studio Code
    - ElixirLS

## How to setup

### Required Components
- Elixir (Erlang)
- PostgreSQL
- C Build Tools (Needed for Argon2)
    - `argon2_elixir` and `comeonin` package

### Installing

#### Elixir (Erlang)

##### Ubuntu LTS
Elixir is the language that Logr is written in.

To install a recent version of Erlang and Elixir, we need to add an un-official repo:

`sudo add-apt-repository ppa:rabbitmq/rabbitmq-erlang`

`sudo apt update`

`sudo apt install elixir erlang` or `sudo apt upgrade`

The package `comeonin` needs you to also install `erlang-dev`:

`sudo apt install erlang-dev`

> [!NOTE]
> For more information on available methods of installing Elixir (Erlang) see the [Elixir install guide](https://elixir-lang.org/install.html).

#### PostgreSQL
PostgreSQL is our database of choice.

##### Ubuntu LTS

`sudo apt install postgresql`

#### C Build Tools
To be able to use Argon2 as our password-hashing algorithm, the `phx.gen.auth` command uses `argon2_elixir` package which is based on `comeonin` package that needs C build tools to be available.

##### Ubuntu LTS

`sudo apt install gcc libc6-dev`

> [!NOTE]
> If you faced any problem with the `argon2_elixir` package and its required components, maybe check out the [`comeonin` wiki page](https://github.com/riverrun/comeonin/wiki/Requirements).

#### `inotify-tools` (Linux)

In order to make the Phoenix live-reload and file-system watcher work, we need the `inotify-tools` package:

##### Ubuntu LTS

`sudo apt install inotify-tools`
