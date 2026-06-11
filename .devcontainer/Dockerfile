# ============================================================================
#  Dockerfile — "receta" para construir la imagen del curso
# ============================================================================
#  Un Dockerfile es un archivo de texto con instrucciones paso a paso que
#  Docker (o Codespaces) lee de arriba hacia abajo para fabricar una
#  "imagen". Una imagen es como un molde congelado de un sistema Linux
#  listo para usar; cada vez que abres el Codespace, se crea un
#  "contenedor" a partir de ese molde.

# Every Docker instruction creates a new image layer.
# Docker can reuse unchanged layers from its cache, which makes future
# builds much faster.
# For that reason, instruction order matters: changing an early layer
# forces Docker to rebuild everything that comes after it.
# (Black Hat Bash Ch.3: Docker images are composed of multiple layers.)

#  Analogía: la imagen es el PLANO, el contenedor es la CASA construida
#  con ese plano. Puedes construir muchas casas iguales a partir de un
#  solo plano, y si destruyes una casa el plano sigue intacto.
#
#  Cada instrucción (FROM, ENV, RUN...) crea una "capa". Docker guarda
#  esas capas en caché: si no cambias las primeras líneas, no las
#  reconstruye y el siguiente build es casi instantáneo.
# ============================================================================


# ----------------------------------------------------------------------------
# FROM: imagen base sobre la que vamos a construir
# ----------------------------------------------------------------------------
# En lugar de partir de cero, partimos de la imagen oficial de Kali Linux
# en su versión "rolling" (actualización continua, siempre al día).
# Todo lo que instalemos más abajo se apila ENCIMA de esta base.

# Base image used for the entire container.
# Docker starts building from this image instead of creating a Linux
# system from scratch.
# Kali Linux is commonly used for cybersecurity and networking labs,
# so it already includes many tools and repositories useful for the course.
# (Black Hat Bash Ch.3: containers are built from reusable images.)
FROM kalilinux/kali-rolling:latest


# ----------------------------------------------------------------------------
# ENV: variables de entorno permanentes dentro del contenedor
# ----------------------------------------------------------------------------
# Las variables de entorno son "ajustes globales" que cualquier programa
# del sistema puede leer. Se escriben en MAYÚSCULAS por convención.
#
#   DEBIAN_FRONTEND=noninteractive
#     Le dice al instalador de paquetes (apt) "no me hagas preguntas
#     interactivas, asume respuestas por defecto". Sin esto, algunos
#     paquetes pausarían el build esperando que pulsemos una tecla y se
#     quedaría colgado para siempre (porque no hay nadie mirando).
#
#   LANG / LC_ALL=es_ES.UTF-8
#     Configuran idioma y codificación de caracteres. UTF-8 es lo que
#     permite que acentos, ñ, €, emojis, etc. se muestren bien.
#
#   TERM=xterm-256color
#     Le indica a los programas que la terminal admite 256 colores, para
#     que vim, nvim, htop, etc. se vean con todos sus colores.
#
# La barra invertida "\" al final de cada línea significa "esto continúa
# en la línea siguiente". Solo es para legibilidad.

# Environment variables define settings available to programs running
# inside the container.
# DEBIAN_FRONTEND=noninteractive prevents package installers from asking
# interactive questions during the build process.
# LANG and LC_ALL configure the default language and character encoding.
# UTF-8 support is required for accented characters and international text.
# TERM=xterm-256color tells terminal applications that 256-color output
# is supported.
# Environment variables are an important part of shell behavior because
# commands can read them during execution.
# (Black Hat Bash Ch.1: environment variables influence command behavior.)
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=es_ES.UTF-8 \
    LC_ALL=es_ES.UTF-8 \
    TERM=xterm-256color


# ----------------------------------------------------------------------------
# Pre-respuesta a una pregunta interactiva de Wireshark
# ----------------------------------------------------------------------------
# Wireshark/tshark PREGUNTA durante su instalación si los usuarios
# normales (no-root) deben poder capturar paquetes. Como en el contenedor
# siempre somos root, respondemos "false" POR ADELANTADO usando
# debconf-set-selections para que no detenga el build esperando input.

# This command preloads an answer into Debian's package configuration
# database before installing tshark.
#
# The pipe (|) sends the output of echo directly into
# debconf-set-selections.
#
# This avoids interactive prompts during the build and allows the image
# to be created automatically.
#
# (Black Hat Bash Ch.1: pipes connect the output of one command to the
# input of another command.)
RUN echo "wireshark-common wireshark-common/install-setuid boolean false" \
    | debconf-set-selections


# ----------------------------------------------------------------------------
# RUN: ejecutar comandos durante la construcción de la imagen
# ----------------------------------------------------------------------------
# Aquí instalamos TODO el software del curso en un solo RUN.
#
#   apt-get update          -> actualiza la lista de paquetes disponibles
#   apt-get install         -> descarga e instala los paquetes listados
#     -y                    -> responde "sí" automáticamente
#     --no-install-recommends -> instala SOLO lo esencial (no los extras
#                                sugeridos). Ahorra cientos de MB.
#
# ¿Por qué un solo RUN gigante y no 10 RUN pequeños?
# Porque CADA RUN crea una capa nueva en la imagen. Menos capas = imagen
# más pequeña, más rápida de construir y de descargar.
#
# El "&&" encadena comandos: ejecuta el siguiente SOLO SI el anterior
# terminó bien. Si algo falla, el build se detiene con error (que es lo
# que queremos: mejor un error claro que una imagen rota).

# This RUN instruction installs all software required for the course.
# apt-get update downloads the latest package lists from configured
# repositories, while apt-get install downloads and installs the
# selected packages.
# The -y option automatically answers "yes" to installation prompts.
# --no-install-recommends installs only required dependencies and avoids
# optional packages that would increase image size.
# Everything is installed in a single RUN instruction because each RUN
# creates a new Docker layer. Fewer layers generally mean a smaller and
# more efficient image.
# The && operator executes the next command only if the previous one
# completed successfully.
# Examples of installed tools:
# - grep: searches for text patterns in files and command output.
# - sed: performs text editing and substitutions from the command line.
# - gawk: processes structured text and extracts data from files.
# - shellcheck: analyzes shell scripts and reports common mistakes.
# - nmap: scans hosts and network services.
# - tcpdump: captures and analyzes network traffic.
# - tshark: command-line version of Wireshark.
# - tor: routes traffic through the Tor network.
# - proxychains4: forces applications to use proxy servers.
# - jq: parses and manipulates JSON data.
# - man-db: provides access to manual pages.
#
# (Black Hat Bash Ch.1: commands, pipes and shell environment.
# Black Hat Bash Ch.2: text-processing tools such as grep, sed and awk.
# Black Hat Bash Ch.3: building lab environments with containers.)
RUN apt-get update && apt-get install -y --no-install-recommends \
    \
    # === Editores de texto y shells (intérpretes de comandos) ===
    neovim \
    vim \
    zsh \
    bash-completion \
    \
    # === Herramientas de 4ta generación ===
    # Estas son las protagonistas de las Unidades 2, 3 y 4:
    perl \
    make \
    gawk \
    sed \
    grep \
    \
    # === Utilidades básicas de UNIX ===
    # coreutils trae cat, ls, head, tail, sort, cut, tr, etc.
    # findutils trae find y xargs.
    # procps trae ps, top, kill (gestión de procesos).
    # less = paginador para leer archivos largos.
    # tree = muestra directorios como árbol.
    # jq = procesa JSON desde la línea de comandos.
    coreutils \
    findutils \
    procps \
    less \
    tree \
    jq \
    \
    # === Páginas de manual (comando `man`) ===
    # La imagen base de Kali viene sin documentación para
    # ahorrar espacio. La reinstalamos porque en el curso "man bash" o
    # "man grep" es material de consulta obligada.
    man-db \
    manpages \
    manpages-posix \
    \
    # === Red básica y utilidades de descarga ===
    curl \
    wget \
    git \
    git-lfs \
    ca-certificates \
    locales \
    \
    # === Linter (revisor automático de errores) para scripts Bash ===
    shellcheck \
    \
    # === Reconocimiento y escaneo de red ===
    # nmap = el escáner de puertos más famoso.
    # masscan = escaneo masivo de rangos grandes de IPs.
    nmap \
    masscan \
    \
    # === Captura y análisis de paquetes de red ===
    # tcpdump = capturador clásico por terminal.
    # tshark = versión de terminal de Wireshark.
    tcpdump \
    tshark \
    \
    # === Utilidades de red variadas ===
    netcat-traditional \
    socat \
    dnsutils \
    whois \
    traceroute \
    mtr-tiny \
    iproute2 \
    net-tools \
    iputils-ping \
    \
    # === Anonimato: Tor y similares ===
    # tor = cliente de la red Tor.
    # torsocks = "envoltorio" que hace pasar cualquier comando por Tor.
    # proxychains4 = encadena múltiples proxies.
    # obfs4proxy = ofusca el tráfico de Tor para evadir bloqueos.
    tor \
    torsocks \
    proxychains4 \
    obfs4proxy \
    \
    # === Cliente HTTP más legible que curl para aprender ===
    httpie \
    \
 # --- Después de instalar, activamos el idioma español ---
 # sed busca "# es_ES.UTF-8" en /etc/locale.gen y le quita el "#" para
 # activar esa línea. Luego locale-gen compila los archivos de idioma.
 && sed -i 's/# es_ES.UTF-8/es_ES.UTF-8/' /etc/locale.gen \
 && locale-gen \
 \

 # sed edits the locale configuration file in place.
# It removes the comment character (#) from the Spanish UTF-8 locale,
# enabling it for the system.
#
# locale-gen generates the locale data so applications can use Spanish
# language settings and UTF-8 character encoding.

 # --- Limpieza final: reducir el tamaño de la imagen ---
 # apt deja archivos de caché que ya no necesitamos después de instalar.
 # Borrarlos aquí (en el mismo RUN) hace la capa final más pequeña.
 # Si los borráramos en otro RUN, seguirían ocupando en la capa anterior.
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

 # apt-get clean removes cached package files that are no longer needed.
#
# rm -rf /var/lib/apt/lists/* removes downloaded package indexes.
#
# Performing cleanup in the same RUN instruction prevents unnecessary
# files from remaining in previous image layers and reduces image size.


# ----------------------------------------------------------------------------
# SHELL: qué intérprete usar en los siguientes RUN
# ----------------------------------------------------------------------------
# Por defecto Docker usa /bin/sh (un shell más limitado y antiguo). Lo
# cambiamos a bash por si agregamos más instrucciones con sintaxis
# moderna (arrays, [[ ]], etc.).

# This instruction changes the default shell used by future RUN commands.
# Docker normally uses /bin/sh, but zsh provides additional features and
# a more user-friendly shell environment.
# Using a specific shell ensures that shell commands behave consistently
# during image construction.
# (Black Hat Bash Ch.1: the shell interprets and executes commands.)
SHELL ["/bin/zsh", "-c"]


# ----------------------------------------------------------------------------
# WORKDIR: directorio de trabajo al entrar al contenedor
# ----------------------------------------------------------------------------
# Codespaces siempre monta el código del repositorio en
# /workspaces/<nombre-del-repo>. Establecer /workspaces aquí hace que las
# terminales se abran cerca de nuestros archivos del curso.

# WORKDIR sets the default working directory for subsequent instructions.
# Any command executed after this point starts from this location unless
# another directory is specified.
# This makes it easier to work with project files because the terminal
# opens in a predictable location.
WORKDIR /workspaces

# Configuración de Git para el contenedor:
# - safe.directory *: confía en cualquier repo montado (necesario porque
#   /workspaces/... tiene un UID distinto al de root dentro del container).
# - init.defaultBranch main: evita warnings de "master vs main" en git init.
# - pull.rebase false: merge por defecto al hacer pull (más intuitivo)
# - git lfs install --system: registra los hooks de LFS globalmente para
#   que, si un repo los necesita, funcionen sin sorpresas.

# This block configures Git for all users inside the container.

# safe.directory '*' prevents Git security warnings when repositories
# are mounted from external locations such as Codespaces.
# init.defaultBranch main sets "main" as the default branch name when
# creating new repositories.
# pull.rebase false makes Git use merge behavior during git pull instead
# of rebasing changes.
# git lfs install --system enables Git Large File Storage support so
# repositories using large files work correctly inside the container.
RUN git config --system --add safe.directory '*' \
 && git config --system init.defaultBranch main \
 && git config --system pull.rebase false \
 && git lfs install --system

# ----------------------------------------------------------------------------
# CMD: comando que se ejecuta por defecto al arrancar el contenedor
# ----------------------------------------------------------------------------
# Lanza una shell bash interactiva. Codespaces la sobrescribe con su
# propia terminal integrada de VS Code, pero es buena práctica dejarla
# definida para que la imagen sea usable también con Docker puro.
# Prompt del curso para bash

# This block uses a here-document (heredoc) to append multiple lines
# to the .zshrc configuration file.

# A heredoc allows text to be redirected into a file until the EOF
# marker is reached.
# The PROMPT variable customizes the appearance of the zsh prompt.
# It configures colors, displays the current directory, and shows the
# exit status of the previous command.

# (Black Hat Bash Ch.1: redirection sends text into files and commands.)
RUN cat >> /root/.zshrc <<'EOF'


PROMPT='%F{cyan}[Cristopher-Venegas]%f %F{yellow}%1~%f %(?.%F{green}ok.%F{red}bad %?)%f %# '
EOF

# CMD defines the default command executed when a container starts.

# Unlike RUN, which executes during image creation, CMD executes when
# the container is launched.
# This starts an interactive zsh session by default, giving the user a
# ready-to-use command-line environment.
# (Black Hat Bash Ch.3: RUN builds the image, CMD runs at container
# startup.)
CMD ["/bin/zsh"]




