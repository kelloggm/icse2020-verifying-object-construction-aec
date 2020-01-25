#!/bin/bash

# install dependencies locally

if [ mvn dependency:get -Dartifact=org.checkerframework:checker:3.1.1.-SNAPSHOT -o -DrepoUrl=file://~/.m2/repository > /dev/null ]; then
    :
else
    pushd /tmp/
    git clone https://github.com/typetools/checker-framework
    pushd checker-framework
    git checkout 7066701682573100cff6becff6fc189e8700d05e

    ./gradlew cloneAndBuildDependencies
    ./gradlew assemble

    export CHECKERFRAMEWORK=`pwd`
    
    mvn install:install-file -DgroupId=org.checkerframework -DartifactId=checker -Dversion=3.1.1-SNAPSHOT -Dpackaging=jar -Dfile=$CHECKERFRAMEWORK/checker/dist/checker.jar
    popd
    popd
fi

if [ mvn dependency:get -Dartifact=net.sridharan.objectconstruction:object-construction-checker:0.1.7-SNAPSHOT -o -DrepoUrl=file://~/.m2/repository ]; then
    :
else
    pushd /tmp/
    git clone https://github.com/kelloggm/object-construction-checker
    pushd object-construction-checker
    git checkout a3e88e7ee61dcca620651604f981c3801c723444

    ./gradlew install

    popd
    popd
fi
