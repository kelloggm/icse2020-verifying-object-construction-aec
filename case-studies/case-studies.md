Case Study Instructions
=============================

These are instructions for reproducing our Object Construction Checker experimental results on our case studies, which appear in table 2.  There are five benchmarks (two using Lombok, and three using AutoValue):

* https://github.com/kelloggm/java-webauthn-server
* https://github.com/kelloggm/clientManagementSystem
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

```
git clone https://github.com/kelloggm/java-webauthn-server && (cd java-webauthn-server && git checkout fixed-with-obj-cons-build)
(cd java-webauthn-server && ./gradlew --console=plain -PcfLocal clean compileJava)
```

```
git clone https://github.com/kelloggm/clientManagementSystem && (cd clientManagementSystem && git checkout fixed-with-obj-cons-build)
(cd clientManagementSystem && ./gradlew --console=plain -PcfLocal clean compileJava)
```

Note that for `clientManagementSystem`, there is no difference between the two branches, because the checker does not issue any warnings. Also, there is another minor change we made to that benchmark: we replaced every javax.annotation.NonNull annotation with a lombok.NonNull annotation, so that our checker could understand the @NonNull annotations in classes with @Builder.

```
git clone https://github.com/msridhar/error-prone && (cd error-prone && git checkout fixed-with-obj-cons-build)
(cd error-prone && mvn -B clean compile)
```

Look for "finalizer" in the Maven output.

```
git clone https://github.com/msridhar/gapic-generator && (cd gapic-generator && git checkout fixed-with-obj-cons-build)
(cd gapic-generator && ./gradlew --console=plain -PcfLocal clean compileJava)
```

```
git clone https://github.com/msridhar/nomulus && (cd nomulus && git checkout fixed-with-obj-cons-build)
(cd nomulus && ./gradlew --console=plain -PcfLocal clean compileJava)
```

Nomulus's buildfile has multiple compilation tasks; add up the summaries such as
6 warnings
1 warning
1 warning
to get the total number of warnings.


Computing results for a benchmark
-----------------------------------

To determine true and false positives for a benchmark, check out the
`fixed-with-obj-cons-build` branch, build the benchmark, and categorize any
warnings from our checker.  For these benchmarks, all warnings are false
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

To count the number of call sites invoking an AutoValue or Lombok
`build()` method, run the `count-verified-calls.sh` script for each
benchmark.
