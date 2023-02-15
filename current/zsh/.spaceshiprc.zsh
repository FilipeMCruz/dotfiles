SPACESHIP_CHAR_SYMBOL="→ "
SPACESHIP_CHAR_SYMBOL_ROOT="▶ "
SPACESHIP_CHAR_SYMBOL_SECONDARY="→ "

SPACESHIP_JOBS_SYMBOL="λ"
SPACESHIP_JOBS_COLOR="red"

SPACESHIP_USER_SHOW=always
SPACESHIP_USER_SUFFIX="%F{blue}@%f"
SPACESHIP_USER_PREFIX=""

SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_COLOR="green"
SPACESHIP_HOST_PREFIX=""

SPACESHIP_DIR_PREFIX="%F{blue}in%f "

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_FORMAT="%F{red}%B::%f %F{yellow}%D{%H:%M}%f %F{red}%B::%f"

SPACESHIP_EXEC_TIME_ELAPSED=1

SPACESHIP_BATTERY_SHOW=always
SPACESHIP_BATTERY_THRESHOLD=10

SPACESHIP_SUDO_SHOW=true
SPACESHIP_SUDO_COLOR="#fe8019"

SPACESHIP_GIT_PREFIX="%F{blue}on%f "

SPACESHIP_PROMPT_ORDER=(
    jobs           # Background jobs indicator
    sudo           # Sudo indicator
    user           # Username section
    host           # Hostname section
    dir            # Current directory section
    git            # Git section (git_branch + git_status)
    hg             # Mercurial section (hg_branch  + hg_status)
    package        # Package version
    node           # Node.js section
    bun            # Bun section
    deno           # Deno section
    ruby           # Ruby section
    python         # Python section
    elm            # Elm section
    elixir         # Elixir section
    xcode          # Xcode section
    swift          # Swift section
    golang         # Go section
    perl           # Perl section
    php            # PHP section
    rust           # Rust section
    haskell        # Haskell Stack section
    scala          # Scala section
    kotlin         # Kotlin section
    java           # Java section
    lua            # Lua section
    dart           # Dart section
    julia          # Julia section
    crystal        # Crystal section
    docker         # Docker section
    docker_compose # Docker section
    aws            # Amazon Web Services section
    gcloud         # Google Cloud Platform section
    azure          # Azure section
    venv           # virtualenv section
    conda          # conda virtualenv section
    dotnet         # .NET section
    ocaml          # OCaml section
    vlang          # V section
    zig            # Zig section
    purescript     # PureScript section
    erlang         # Erlang section
    kubectl        # Kubectl context section
    ansible        # Ansible section
    terraform      # Terraform workspace section
    pulumi         # Pulumi stack section
    ibmcloud       # IBM Cloud section
    nix_shell      # Nix shell
    gnu_screen     # GNU Screen section
    exec_time      # Execution time
    #async          # Async jobs indicator
    line_sep       # Line break
    battery        # Battery level and status
    exit_code      # Exit code section
    char           # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
    time
)
