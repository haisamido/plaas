# PLaaS
Plotting as a Service (PLaaS)

## How to start
```docker pull haisamido/plaas```

## How to run
```docker run -d -p 2222:22 haisamido/plaas```

## How to plot
```ssh \
-o GlobalKnownHostsFile=/dev/null \
-o UserKnownHostsFile=/dev/null \
-t root@localhost \
-p 2222 "/usr/bin/gnuplot -p -e 'set terminal dumb;plot sin(x)'"```

#### Should return
```
    1 +--------------------------------------------------------------------+
      |                *  *              +  *  **         +       *  *     |
  0.8 |-+             *   *                 *    *          sin(x* *******-|
      |              *     *                *    *               *    *    |
  0.6 |-+            *      *              *     *               *     * +-|
      |              *      *             *       *             *       *  |
  0.4 |*+            *      *             *       *             *       *+-|
      |*            *        *            *        *           *        *  |
  0.2 |*+           *        *            *        *           *        *+-|
      | *          *          *          *         *          *          * |
    0 |-*          *          *          *         *          *          *-|
      |  *         *          *         *           *         *           *|
 -0.2 |-+*         *          *         *           *         *          +*|
      |  *        *            *       *             *       *            *|
 -0.4 |-+*        *            *       *             *       *           +*|
      |   *      *              *      *             *      *              |
 -0.6 |-+ *     *               *     *              *      *            +-|
      |    *    *               *     *               *     *              |
 -0.8 |-+   *   *                *   *                 *   *             +-|
      |     *  *       +         **  *   +             *  *                |
   -1 +--------------------------------------------------------------------+
     -10              -5                 0                5                10
```
## How to build from scratch
```docker build -t myplaas https://raw.githubusercontent.com/haisamido/plaas/master/Dockerfile```
