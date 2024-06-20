#!/usr/bin/env bash
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$ROOT_DIR/../utils.sh"

# shellcheck disable=SC2005
plugin_mem_cpu_load_icon=$(get_tmux_option "@theme_plugin_mem_cpu_load_icon" " ")
plugin_mem_cpu_load_accent_color=$(get_tmux_option "@theme_plugin_mem_cpu_load_accent_color" "blue7")
plugin_mem_cpu_load_accent_color_icon=$(get_tmux_option "@theme_plugin_mem_cpu_load_accent_color_icon" "blue0")
plugin_mem_cpu_load_bin=$(get_tmux_option "@theme_plugin_mem_cpu_load_bin" "tmux-mem-cpu-load")

# https://github.com/thewtex/tmux-mem-cpu-load?tab=readme-ov-file#configuring-tmux
plugin_mem_cpu_load_args=$(get_tmux_option "@theme_plugin_mem_cpu_load_args" "--colors --interval 2")

function load_plugin() {
    if ! command -v ${plugin_mem_cpu_load_bin} &>/dev/null; then
        exit 1
    fi

	# echo "${plugin_mem_cpu_load_bin} ${plugin_mem_cpu_load_args}"
    echo $("${plugin_mem_cpu_load_bin} ${plugin_mem_cpu_load_args}")
}
load_plugin

export plugin_mem_cpu_load_icon plugin_mem_cpu_load_accent_color plugin_mem_cpu_load_accent_color_icon
