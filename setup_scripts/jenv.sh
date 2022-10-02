# JENV
# https://www.jenv.be/
# https://github.com/jenv/jenv
git clone https://github.com/jenv/jenv.git ~/.jenv

jenv enable-plugin export
jenv enable-plugin maven
jenv enable-plugin gradle

## Check java version
# jenv versions

## Add JAVA environments
# jenv add /usr/lib/jvm/java-1.8.0-openjdk-amd64/
# jenv add /usr/lib/jvm/java-11-openjdk-amd64/

## Set java version
# jenv global 11
# jenv local 1.8
# jenv shell 11