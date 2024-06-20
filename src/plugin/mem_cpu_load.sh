#!/usr/bin/env bash
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$ROOT_DIR/../utils.sh"

plugin_mem_cpu_load_icon=$(get_tmux_option "@theme_plugin_mem_cpu_load_icon" " ")
plugin_mem_cpu_load_accent_color=$(get_tmux_option "@theme_plugin_mem_cpu_load_accent_color" "blue7")
plugin_mem_cpu_load_accent_color_icon=$(get_tmux_option "@theme_plugin_mem_cpu_load_accent_color_icon" "blue0")
plugin_mem_cpu_load_bin=$(get_tmux_option "@theme_plugin_mem_cpu_load_bin" "tmux-mem-cpu-load")

# https://github.com/thewtex/tmux-mem-cpu-load?tab=readme-ov-file#configuring-tmux
plugin_mem_cpu_load_args=$(get_tmux_option "@theme_plugin_mem_cpu_load_args" "--colors --interval 2")

export plugin_mem_cpu_load_icon plugin_mem_cpu_load_accent_color plugin_mem_cpu_load_accent_color_icon

function load_plugin() {
    exec_cmd="${plugin_mem_cpu_load_bin} ${plugin_mem_cpu_load_args}"
    result=$($exec_cmd)
    if [[ $? -ne 0 ]]; then
        exit 1
    else
        echo $result
    fi
}

load_plugin

