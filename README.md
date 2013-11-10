# `heatmap.sh` - Heatmap cli

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

Random sample output:

```
░▒▓░▒
▒▓▓▓▓
▓▓▓▒▓
▒▓▒▓▒
░▒▓▓▓
```


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
