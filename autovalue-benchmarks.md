AutoValue Benchmark Instructions
=============================

These are instructions for reproducing our Object Construction Checker experimental results on AutoValue benchmarks.  There are three benchmarks:

* https://github.com/msridhar/error-prone
* https://github.com/msridhar/gapic-generator
* https://github.com/msridhar/nomulus

Each repository has the following two branches:
* `base-with-obj-cons-build`: The base version we used for our experiment, with the build scripts modified so that our checker runs.  There are no source code modifications on this branch.
* `fixed-with-obj-cons-build`: A version where we have added annotations to specify behavior.  Any remaining warnings reported by our checker are either (1) true positives or (2) false positives where additional annotations cannot remove the warning.  Table 2 in the paper lists the number of warnings produced.

Setting up our checker
----------------------

See the instructions in `setting-up-the-checker.md`.

Running the checker
-----------------------------------

git clone https://github.com/msridhar/error-prone && (cd error-prone && git checkout fixed-with-obj-cons-build)
(cd error-prone && mvn clean compile)

git clone https://github.com/msridhar/gapic-generator && (cd gapic-generator && git checkout fixed-with-obj-cons-build)
(cd gapic-generator && ./gradlew -PcfLocal compileJava)

git clone https://github.com/msridhar/nomulus && (cd nomulus && git checkout fixed-with-obj-cons-build)
(cd nomulus && ./gradlew -PcfLocal compileJava)

Computing results for a benchmark
-----------------------------------

To determine true and false positives for a benchmark, check out the
`fixed-with-obj-cons-build` branch, build the benchmark, and categorize any
warnings from our checker.  To build a benchmark, run `./typecheck.sh` in the
benchmark directory.  For the AutoValue benchmarks, all warnings are false
positives except for the following one from `gapic-generator`:

```
/Users/msridhar/git-repos/dljc-experiment/outdir/gapic-generator/src/main/java/com/google/api/codegen/transformer/java/JavaSurfaceTransformer.java:729: warning: [finalizer.invocation.invalid] This finalizer cannot be invoked, because the following methods have not been called: outputPath()
    return packageInfo.build();
```

To compute LoC added, LoC removed, and Annos, compute a diff of the changes we made:

```
git diff base-with-obj-cons-build fixed-with-obj-cons-build
```

The changes need to be categorized appropriately; this should be straightforward.

To compute lines of code, we used cloc. See the `count-loc.sh` script in each benchmark.

To count the number of verified call sites, run the `count-verified-calls.sh`
script for each benchmark. The number of verified calls is computed by running the Checker Framework in a special mode that prints every comparison it makes, and then counting in that output the number of times the receiver of a method called "build()" is checked against a non-trivial (that is, not top) @CalledMethods type.
