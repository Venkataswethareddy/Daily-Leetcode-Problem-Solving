# CodeAuraGirl - LeetCode Daily Solutions

LeetCode ID: https://leetcode.com/u/CodeAuraGirl/

Problem 3454 - Separate Squares II
Submission: https://leetcode.com/problems/separate-squares-ii/solutions/7585777/easy-by-codeauragirl-o3ox
Solution (Dart):

```
class Solution {
  double separateSquares(List<List<int>> squares) {
    int n = squares.length;
    int m = 2 * n;

    List<_Event> events = List.filled(m, _Event(0, 0, 0, 0));
    List<double> xsRaw = List.filled(m, 0.0);

    int idx = 0, xi = 0;
    for (var sq in squares) {
      double x = sq[0].toDouble();
      double y = sq[1].toDouble();
      double l = sq[2].toDouble();
      double x2 = x + l;
      double y2 = y + l;
      events[idx++] = _Event(y, x, x2, 1);
      events[idx++] = _Event(y2, x, x2, -1);
      xsRaw[xi++] = x;
      xsRaw[xi++] = x2;
    }

    events.sort((a, b) => a.y.compareTo(b.y));
    List<double> xs = _compress(xsRaw);

    double total = _calculateTotalUnionArea(events, xs, m);
    double target = total / 2.0;
    return _findSplitPoint(events, xs, m, target);
  }

  double _calculateTotalUnionArea(
      List<_Event> events, List<double> xs, int m) {
    var segTree = _SegmentTree(xs);
    double total = 0.0;
    double lastY = events[0].y;
    int i = 0;

    while (i < m) {
      double curY = events[i].y;
      if (curY > lastY) {
        total += segTree.query() * (curY - lastY);
        lastY = curY;
      }
      while (i < m && events[i].y == curY) {
        var idxs = _findIndices(xs, events[i]);
        segTree.update(1, 0, xs.length - 1, idxs[0], idxs[1], events[i].type);
        i++;
      }
    }
    return total;
  }

  double _findSplitPoint(
      List<_Event> events, List<double> xs, int m, double target) {
    var segTree = _SegmentTree(xs);
    double lastY = events[0].y;
    double area = 0.0;
    int i = 0;

    while (i < m) {
      double curY = events[i].y;
      if (curY > lastY) {
        double unionX = segTree.query();
        double dy = curY - lastY;
        if (area + unionX * dy >= target - 1e-10) {
          return lastY + (target - area) / unionX;
        }
        area += unionX * dy;
        lastY = curY;
      }
      while (i < m && events[i].y == curY) {
        var idxs = _findIndices(xs, events[i]);
        segTree.update(1, 0, xs.length - 1, idxs[0], idxs[1], events[i].type);
        i++;
      }
    }
    return lastY;
  }

  List<int> _findIndices(List<double> xs, _Event e) {
    int l = _binarySearch(xs, e.x1);
    int r = _binarySearch(xs, e.x2);
    if (l < 0) l = -l - 1;
    if (r < 0) r = -r - 1;
    return [l, r];
  }

  List<double> _compress(List<double> arr) {
    arr.sort();
    List<double> res = [arr[0]];
    for (int i = 1; i < arr.length; i++) {
      if (arr[i] != arr[i - 1]) res.add(arr[i]);
    }
    return res;
  }

  int _binarySearch(List<double> arr, double target) {
    int l = 0, r = arr.length - 1;
    while (l <= r) {
      int m = (l + r) >> 1;
      if (arr[m] == target) return m;
      if (arr[m] < target) {
        l = m + 1;
      } else {
        r = m - 1;
      }
    }
    return -l - 1;
  }
}

class _Event {
  double y, x1, x2;
  int type;
  _Event(this.y, this.x1, this.x2, this.type);
}

class _SegmentTree {
  List<double> xs;
  List<double> tree;
  List<int> count;

  _SegmentTree(this.xs)
      : tree = List.filled(4 * xs.length, 0.0),
        count = List.filled(4 * xs.length, 0);

  void update(int idx, int l, int r, int ql, int qr, int val) {
    if (qr <= l || ql >= r) return;
    if (ql <= l && r <= qr) {
      count[idx] += val;
    } else {
      int mid = (l + r) >> 1;
      update(idx << 1, l, mid, ql, qr, val);
      update(idx << 1 | 1, mid, r, ql, qr, val);
    }
    if (count[idx] > 0) {
      tree[idx] = xs[r] - xs[l];
    } else if (r - l == 1) {
      tree[idx] = 0.0;
    } else {
      tree[idx] = tree[idx << 1] + tree[idx << 1 | 1];
    }
  }

  double query() => tree[1];
}
```

If you like my solution, please give it a rating. Thank you.

