AMI Sniping Experiment Instructions
===================================

These are the instructions for reproducing our AMI sniping experiments that appear
in table 1 of the paper. Only the first column of numbers ("open-source") is
reproducible, because the second column describes experiments that were carried
out on a set of closed-source codebases that we cannot share.

The data and scripts for the AMI sniping experiment are in the directory "ami-sniping".
That directory contains a number of files:
* `dependencies.sh` sets up the Checker Framework, Object Construction Checker, and
other infrastructure that the experiment needs. Note that even if you have already run
the `dependencies.sh` script used for the AutoValue and Lombok case studies, you will
still need to run this script **in the directory in which you will carry out the
experiments**.
* `ami-sniping-triage.xlsx` contains our record of the projects in the benchmark set, and which errors we categorized as true positives, false positives, or requiring annotations
* `original.sh` and `original.in` is the script and the input, respectively, for running the experiment the first time (i.e. on the raw repositories). The input (`original.in`) is a list of git repositories and git shas. When the script is executed, it will check out each project at the given sha, and then run the object construction checker on it. Note that the script contains some hardcoded paths (to the object construction checker and its dependencies); if you wish to run this experiment outside of the VM, you will need to update those paths. Once the script completes (depending on your machine, it may take a few hours), you will see two directories: original/ and original-results/. The former contains all of the projects' local checkouts, and the latter contains the logs obtained by running the checker on each project.
* `fixed.sh` and `fixed.in` are the counterparts to `original.sh` and `original.in`, respectively, using our "fixed" versions of the projects: that is, they contain annotations and notes (in comments) on each project that issued a warning in the original set. For each project with any changes, this script will also add a git remote for the original, so that you can run `git diff` to see our changes. It would, however, probably be quicker and easier to just look at those changes on GitHub: our forks of each modified project (which you can find by looking for any value in columns G-J in `ami-sniping-triage.xlsx`) can be found under the GitHub user `kelloggm`.
* `run-dljc.sh`: this is an internal script that contains most of the logic used by `original.sh` and `fixed.sh`.