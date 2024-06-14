#بسم الله الرحمن الرحيم
#la ilaha illa Allah Mohammed Rassoul Allah

###########################  CHAT-GPT

# { pkgs ? import <nixpkgs> {} }:
#
# pkgs.mkShell {
#   buildInputs = [
#     pkgs.mysql
#   ];
#
#   shellHook = ''
#     # Initialize MySQL data directory if not already done
#     if [ ! -d "$HOME/mysql-data" ]; then
#       echo "Initializing MySQL data directory..."
#       mysqld --initialize-insecure --datadir=$HOME/mysql-data
#     fi
#
#     # Start MySQL server
#     echo "Starting MySQL server..."
#     mysqld --datadir=$HOME/mysql-data --socket=$HOME/mysql.sock &
#     export MYSQL_PID=$!
#     echo "MySQL server started with PID $MYSQL_PID"
#
#     # Ensure MySQL client uses the correct socket
#     export MYSQL_UNIX_PORT=$HOME/mysql.sock
#
#     # Wait for MySQL to be ready
#     echo "Waiting for MySQL server to be ready..."
#     until mysqladmin ping &>/dev/null; do
#       sleep 1
#     done
#     echo "MySQL server is ready!"
#   '';
#
#   # Clean up MySQL server on exit
#   afterShellHook = ''
#     if [ ! -z "$MYSQL_PID" ]; then
#       echo "Stopping MySQL server with PID $MYSQL_PID..."
#       kill $MYSQL_PID
#     fi
#   '';
# }


############### https://jeancharles.quillet.org/posts/2022-01-30-Local-mariadb-server-with-nix-shell.html
let pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = [ pkgs.mariadb ];
  shellHook = ''
    echo "بسم الله الرحمن الرحيم"
    echo "la ilaha illa Allah Mohammed Rassoul Allah"
    MYSQL_BASEDIR=${pkgs.mariadb}
    MYSQL_HOME="$PWD/mysql"
    MYSQL_DATADIR="$MYSQL_HOME/data"
    export MYSQL_UNIX_PORT="$MYSQL_HOME/mysql.sock"
    MYSQL_PID_FILE="$MYSQL_HOME/mysql.pid"

    if [ ! -d "$MYSQL_HOME" ]; then
      # Make sure to use normal authentication method otherwise we can only
      # connect with unix account. But users do not actually exists in nix.
      mysql_install_db --no-defaults --auth-root-authentication-method=normal \
        --datadir="$MYSQL_DATADIR" --basedir="$MYSQL_BASEDIR" \
        --pid-file="$MYSQL_PID_FILE"
    fi

    # Starts the daemon
    # - Don't load mariadb global defaults in /etc with `--no-defaults`
    # - Disable networking with `--skip-networking` and only use the socket so 
    #   multiple instances can run at once
    mysqld --no-defaults --skip-networking --datadir="$MYSQL_DATADIR" --pid-file="$MYSQL_PID_FILE" \
      --socket="$MYSQL_UNIX_PORT" 2> "$MYSQL_HOME/mysql.log" &
    MYSQL_PID=$!

    finish()
    {
      mysqladmin -u root --socket="$MYSQL_UNIX_PORT" shutdown
      kill $MYSQL_PID
      wait $MYSQL_PID
    }
    trap finish EXIT
  '';
}

