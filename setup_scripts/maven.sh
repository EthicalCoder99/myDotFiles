# MAVEN
# https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-20-04/
sudo apt install maven

# Alternate way
# Download the .zip or .tar.gz file from official site.
# Extract it into /usr/local/apache-maven/apache-maven-<version>
# Add this to the .zshrc or .bashrc
export M2_HOME=/usr/local/apache-maven/apache-maven-3.6.3
export M2=$M2_HOME/bin
export PATH=$M2:$PATH