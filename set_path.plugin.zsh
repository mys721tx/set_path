# -*- mode: sh; sh-indentation: 4; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Copyright (c) 2022-2023 Yishen Miao

# According to the Zsh Plugin Standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html

# Standard hash for plugins, to not pollute the namespace
typeset -gA Plugins

if type brew &>/dev/null
then
  fpath+=( "$(brew --prefix)/share/zsh/site-functions" )
fi

if [[ -d "$HOME/go/bin" ]]; then
    path+="$HOME/go/bin"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  if [[ -f "/Applications/Tailscale.app/Contents/MacOS/Tailscale" && ! -f "$(brew --prefix tailscale 2>/dev/null)/bin/tailscale" ]]; then
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
  fi
fi

# Use alternate vim marks [[[ and ]]] as the original ones can
# confuse nested substitutions, e.g.: ${${${VAR}}}

# vim:ft=zsh:tw=80:sw=4:sts=4:et:foldmarker=[[[,]]]
