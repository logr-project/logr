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
- Node.js LTS

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
To be able to use Argon2 as our password-hashing algorithm, the `phx.gen.auth` command uses `argon2_elixir` package, which is based on `comeonin` package that needs C build tools to be available.

##### Ubuntu LTS

`sudo apt install gcc libc6-dev`

> [!NOTE]
> If you faced any problem with the `argon2_elixir` package and its required components, maybe check out the [`comeonin` wiki page](https://github.com/riverrun/comeonin/wiki/Requirements).

#### `inotify-tools` (Linux)

To make the Phoenix live-reload feature work, we need a file-system watcher, so we use the `inotify-tools` package:

##### Ubuntu LTS

`sudo apt install inotify-tools`

> [!NOTE]
> You can see the [`inotify-tools` wiki](https://github.com/inotify-tools/inotify-tools/wiki) for more information.

#### Node.js LTS

We also need Node.js, to have `npx` (e.g. for the `@tailwindcss/upgrade` tool) or manage packages with `npm`.

##### Ubuntu LTS

To install a recent version of Node.js (e.g. the `@tailwindcss/upgrade` tool needs Node.js 20+) we need to use a node version manager tool. We use `fnm` for our environment.

`sudo apt install curl unzip`

`curl -o- https://fnm.vercel.app/install | bash`

`fnm install 22`

To verify the Node.js version:

`node -v` 

To verify the `npm` version:

`npm -v`

> [!NOTE]
> For more information on available install methods, see [Node.js download page](https://nodejs.org/en/download) or [`fnm` installation guide](https://github.com/Schniz/fnm#installation).