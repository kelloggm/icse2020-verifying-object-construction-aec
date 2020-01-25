Reproduction package for "Verifying Object Construction"
========================================================

This is the reproduction package for the ICSE2020 paper "Verifying Object Construction" by Kellogg, Sridharan, Ran, Schaef, and Ernst.

The main repository for the tool is [https://github.com/kelloggm/object-construction-checker](https://github.com/kelloggm/object-construction-checker).

This directory contains a number of `.md` files that describe how to reproduce different parts of the paper's evaluation.

In the order in which they appear in the paper:
* `ami-sniping.md` contains instructions to reproduce table 1. This is the most time-consuming experiment.
* `autovalue-benchmarks.md` and `lombok-benchmarks.md` contain the instructions to reproduce table 2. The instructions are slightly different for the two builder frameworks.
* `user-study.md` contains information on the user study described in section 6.2.2.

For the convenience of the reviewers, we have provided a virtual machine image
containing all the dependencies, etc., already set up. The home directory of
that virtual machine contains a copy of this archive. The virtual machine
was created using Oracle VirtualBox Version 5.2.34 r133893.
