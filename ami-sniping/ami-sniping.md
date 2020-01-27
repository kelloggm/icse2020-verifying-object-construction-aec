AMI Sniping Experiment Instructions
===================================

These are the instructions for reproducing our AMI sniping experiments
that appear in table 1 of the paper. Only the first column of numbers
("open-source") is reproducible, because the second column describes
experiments that were carried out on a set of closed-source codebases
that we cannot share.

Note that this experiment is time-consuming. We recommend that you start it,
and carry out the rest of the reproduction work while it is running.

First, setup the dependencies (on the VM, this has been done for you):

```
./dependencies.sh
```

There are two ways to run the experiments:
* "original": codebases are pulled unmodified from GitHub
* "fixed": codebases that needed modifications (such as annotations) to verify have them present during the experiment

Running either experiment will lead to the same results. We therefore will assume going forward that you
will run the "fixed" version in these instructions, so that you can better observe the choices we made
while triaging the original reports.

If you ARE on the VM, you can skip this paragraph. If you are NOT on the VM, you will need to modify `fixed.sh` before proceeding with the next step. There are three hard-coded paths in the `fixed.sh` script: the set of dependencies of the object construction checker (the `-l` argument) and the set of dependencies for the annotations used by the checker (the `-q` argument), and the location of the Java 8 JDK. You can construct the `-l` argument by running `./gradlew printClasspath` in the `object-construction-checker` directory created by `dependencies.sh`. You can construct the `-q` argument from the above by copying the locations of the three files listed in the current `-q` argument from your `-l` argument. You will then need to update the `JAVA8_HOME` variable in `fixed.sh` to point to a Java 8 JDK.

Run `fixed.sh`:

```
./fixed.sh
```

When the script finishes executing, it will create two directories:
* `fixed`, which contains each codebase that was checked, and
* `fixed-results`, which contains copies of the typechecking logs for each codebase

You can get the list of the codebases that issue errors using this command:

```
grep -l "error:" fixed-results/*.log
```

We provide our triaging results in a spreadsheet: `ami-sniping-triage.xlsx`. You can compare the list of
error-issuing codebases to our categorizations of true positives, false positives, etc.
