#!/bin/sh
# shellcheck shell=sh
#

[ -x "$(which tomlq)" ] && \
  printf "$(cat pyproject.toml | tomlq -r .project.version) \n"

#$(cat pyproject.toml | tomlq .dev_version)
