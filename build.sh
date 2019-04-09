#!/bin/bash

TITLE="Define Env Variable for API TEST Docker image and add a global run command"

installAlias() {
  local f="$1"
  if [ -f "$f" ]; then
    if ! grep -q "${TITLE}" "$f"
      then
        echo '' >> "$f"
        echo "# ${TITLE}" >> "$f"
        echo "alias 'run-test-api'='docker run -it --rm --net=host -v \"\$(pwd):/app/context\" -e HOST_USER=\$UID -e HOST_GROUP=\$(id -g \$USERNAME) -e REPNAME=\"\${REPNAME:-Name}\" -e REPTITLE=\"\${REPTITLE:-Title}\" patagoniansys/qa-api-automatizacion:latest --'" >> "$f"
        echo '' >> "$f"
      fi
  fi
}

installAlias ~/.bashrc
installAlias ~/.zshrc
installAlias ~/.shrc
installAlias ~/.bash_profile
