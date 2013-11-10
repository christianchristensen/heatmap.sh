#!/usr/bin/env roundup

describe "heatmap.sh: Generates a heatmap for a set of data."

heatmap="./heatmap.sh"

it_shows_help_with_no_argv() {
  $heatmap | grep USAGE
}

it_graphs_argv_data() {
  graph="$($heatmap 1,5,22,13,5)"

  test $graph = '░
█
▒
░'
}

it_charts_pipe_data() {
  data="1,30,55,80,33,150"
  graph="$(echo $data | $heatmap)"

  test $graph = '░
░
▒
░
█'
}

it_charts_spaced_data() {
  data="6 1 3 6 1 8 3 3 5 6 8 5 5"
  graph="$($heatmap $data)"

  test $graph = '░▒▓░█▒
▒▓▓█▓▓'
}

it_charts_way_spaced_data() {
  data="1 30               55 80 33     150"
  graph="$($heatmap $data)"

  test $graph = '░
░
▒
░
█'
}
