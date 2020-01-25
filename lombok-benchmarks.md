Lombok Benchmark Instructions
=============================

These are instructions for reproducing our Object Construction Checker experimental results on Lombok benchmarks.  There are two benchmarks:

* https://github.com/kelloggm/clientManagementSystem
* https://github.com/kelloggm/java-webauthn-server

Each repository has the following two branches:
* `base-with-obj-cons-build`: The base version we used for our experiment, with the build scripts modified so that our checker runs.  There are no source code modifications on this branch.
* `fixed-with-obj-cons-build`: A version where we have added annotations to specify behavior, if necessary.  Any remaining warnings reported by our checker are either (1) true positives or (2) false positives where additional annotations cannot remove the warning.  Table 2 in the paper lists the number of warnings produced.

Setting up our checker
----------------------

See the instructions in `setting-up-the-checker.md`.

Running the checker
-----------------------------------

git clone https://github.com/kelloggm/clientManagementSystem && (cd clientManagementSystem && git checkout fixed-with-obj-cons-build)
(cd clientManagementSystem && ./gradlew -PcfLocal compileJava)

git clone https://github.com/kelloggm/java-webauthn-server && (cd java-webauthn-server && git checkout fixed-with-obj-cons-build)
(cd java-webauthn-server && ./gradlew -PcfLocal compileJava)


Note that for `clientManagementSystem`, there is no difference between the two branches, because the checker does not issue any warnings. Also, there is another minor change we made to that benchmark: we replaced every javax.annotation.NonNull annotation with a lombok.NonNull annotation, so that our checker could understand the @NonNull annotations in classes with @Builder.

Computing results for a benchmark
-----------------------------------

To determine true and false positives for a benchmark, categorize the
checker warnings.

To compute LoC added, LoC removed, and Annos, compute a diff of the changes we made:

```
git diff base-with-obj-cons-build fixed-with-obj-cons-build
```

The changes need to be categorized appropriately; this should be straightforward.

To compute lines of code, we used cloc. See the `count-loc.sh` script in each benchmark.

To compute the number of calls we verified, see the `count-callsites.sh` script in each benchmark.
TODO: explain counting # of verified calls
