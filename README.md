Reproduction package for "Verifying Object Construction"
========================================================

This is the reproduction package for the ICSE2020 paper "Verifying Object Construction" by Kellogg, Sridharan, Ran, Schaef, and Ernst.

The main repository for the tool is [https://github.com/kelloggm/object-construction-checker](https://github.com/kelloggm/object-construction-checker).

This directory contains three subdirectories corresponding to three parts of the paper's evaluation:

In the order in which they appear in the paper:
* `ami-sniping` contains instructions to reproduce table 1. This is the most time-consuming experiment to reproduce. See `ami-sniping/ami-sniping.md`.
* `case-studies` contains the instructions to replicate table 2. The file `case-studies.md` contains the replication instructions.
* `user-study/user-study.md` contains information on the user study described in section 6.2.2.

For the convenience of the reviewers, we have provided a virtual machine image
containing all the dependencies, etc., already set up. The home directory of
that virtual machine contains a copy of this archive. The virtual machine
was created using Oracle VirtualBox Version 5.2.34 r133893.

The username and password for the virtual machine are 'icse2020' (without the quotes).