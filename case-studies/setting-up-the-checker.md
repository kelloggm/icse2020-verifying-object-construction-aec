Setting up the Object Construction Checker
------------------------------------------

To clone projects into /tmp/ and install two jar files into your local Maven repository:

1. Install the prerequisites listed at https://checkerframework.org/manual/#build-source .

2. Ensure that you are using Java 8.  For example, on Ubuntu run:

    update-java-alternatives --set java-1.8.0-openjdk-amd64

3. Run `dependencies.sh` from this directory.  This will take several minutes.

4. export CHECKERFRAMEWORK=/tmp/checker-framework
