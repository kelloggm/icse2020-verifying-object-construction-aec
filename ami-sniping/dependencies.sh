#!/bin/sh

# install dependencies for AMI sniping experiment

### Checker Framework
git clone https://github.com/typetools/checker-framework
pushd checker-framework
git checkout 7066701682573100cff6becff6fc189e8700d05e

./gradlew cloneAndBuildDependencies
./gradlew assemble

export CHECKERFRAMEWORK=`pwd`

popd

### Object Construction Checker
git clone https://github.com/kelloggm/object-construction-checker
pushd object-construction-checker
git checkout d3c34a759715f6c4fd0521b0b69c29a6973dfd7b

./gradlew assemble

echo "use this classpath for the object construction checker:"

./gradlew printClasspath

popd

### do-like-javac, which runs a checker on a target project automatically
### by observing its build
git clone https://github.com/kelloggm/do-like-javac
pushd do-like-javac
git checkout occ

popd
