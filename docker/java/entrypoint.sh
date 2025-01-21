#!/bin/bash

# Define the color for the shell prompt (used in output).
PROMPT="\033[1m\033[33mprocess@hostinger~"
export PROMPT

# If the TZ environment variable is not set, default it to UTC.
TZ=${TZ:-UTC}
export TZ

# Get the internal Docker IP and store it in an environment variable.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Change to the process's working directory.
cd /home/process || exit 1

# Print the currently installed Java version.
printf "${PROMPT} \033[0mjava -version\n"
java -version

# Replace "{{VARIABLE}}" with the shell variable syntax "${VARIABLE}",
# evaluate the string, and replace values automatically.
PARSED=$(echo "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g' | eval echo "$(cat -)")

# Print the command that will be executed and execute it in the process's environment.
printf "${PROMPT} \033[0m%s\n" "$PARSED"

# Execute the prepared command with the process's environment variables.
# (SC2086 warning about unsafe variable use is ignored here.)
exec env ${PARSED}