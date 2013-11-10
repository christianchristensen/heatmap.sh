# `heatmap.sh` - Heatmap cli

[heatmaps in your terminal](http://en.wikipedia.org/wiki/Heat_map)


### Inspiration (and notes/refs)

Based off: [holman/spark](https://github.com/holman/spark)

Notes

*  https://github.com/brendangregg/HeatMap
   *  Latency
      *  X: Time
      *  Y: Latency
      *  Z: Frequency? (Count)
*  https://github.com/holman/spark
*  d3.js [gallery](https://github.com/mbostock/d3/wiki/Gallery)
   *  [Day / Hour Heatmap](http://bl.ocks.org/tjdecke/5558084)
   *  [Heatmap (2D Histogram, CSV)](http://bl.ocks.org/mbostock/3202354)
   *  [Heatmap (Canvas, JSON)](http://bl.ocks.org/mbostock/3074470)
   *  [Scatterplot](http://bl.ocks.org/mbostock/3887118)
   *  [Treemap](http://bl.ocks.org/mbostock/4063582)
*  [Using R to draw a Heatmap](http://www2.warwick.ac.uk/fac/sci/moac/people/students/peter_cock/r/heatmap)


### Ideas

Data-center (groups) activity blinkenlights

*  Rel: http://dtrace.org/blogs/brendan/2011/12/18/visualizing-device-utilization/ (see: Animated Data)
![Animated CPU Data](http://dtrace.org/blogs/brendan/files/2011/12/cpu-animated-600.gif)
*  Axes
   *  X: Grouping (datacenter)
   *  Y: Time (0-24 hours)
   *  Z: Usage (agg, avg, cpu usage)
*  Replay the time-series to show over longer spans of time (animate)


## Info and example

Example from [Day / Hour Heatmap](http://bl.ocks.org/tjdecke/5558084)

```sh
$ ./heatmap.sh 24 16 20 0 0 0 2 0 9 25 49 57 61 37 66 70 55 51 55 17 20 9 4 0 12 6 2 0 0 0 2 4 11 28 49 51 47 38 65 60 50 65 50 22 11 12 9 0 13 5 8 8 0 0 2 5 12 34 43 54 44 40 48 54 59 60 51 21 16 9 5 4 7 0 0 0 0 0 2 4 13 26 58 61 59 53 54 64 55 52 53 18 3 9 12 2 8 2 0 8 2 0 2 4 14 31 48 46 50 66 54 56 67 54 23 14 6 8 7 0 8 2 0 2 0 0 0 4 8 8 6 14 12 9 14 0 4 7 6 0 0 0 0 0 0 7 6 0 0 0 0 0 0 0 0 2 2 5 6 0 4 0 2 10 7 0 19 9 4
░▒░░░░░░▒▓▓█▒██▓▓▓░▒░░░░
░░░░░░░░▒▓▓▓▒██▓█▓▒░░░░░
░░░░░░░░▒▓▓▓▓▓▓▓█▓▒░░░░░
░░░░░░░░▒▓█▓▓▓█▓▓▓░░░░░░
░░░░░░░░▒▓▓▓█▓▓█▓▒░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░░░░░░░░░
```

Compare to:
![Day / Hour Heatmap output](https://f.cloud.github.com/assets/65640/1509518/ccb70d6c-4a50-11e3-9c15-6bf37f3ce955.png)

```
X     Z
|   /
|  /
| /
|/
*____ Y
```

Use:

*  ░ Light shaded block
*  ▒ Medium shaded block
*  ▓ Dark shaded block
*  █ Darker shaded block
