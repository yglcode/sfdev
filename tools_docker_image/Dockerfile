#--- docker image for SF client dev tools ---
FROM ubuntu:16.04

#--- base ---

RUN apt-get -y update \
    && apt-get -y install curl wget software-properties-common apt-transport-https lsb-release ca-certificates

#--- add servicefabric repo ---
RUN sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/servicefabric/ xenial main" > /etc/apt/sources.list.d/servicefabric.list'

#--- install dot-net ---
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb

#--- GnuPG ---
RUN curl -fsSL https://packages.microsoft.com/keys/msopentech.asc | apt-key add -

#--- add docker repo ---
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#--- add azul JDK repo ---
RUN curl -fsSL https://repos.azul.com/azul-repo.key | apt-key add - \
    && add-apt-repository 'deb http://repos.azulsystems.com/ubuntu stable main'

RUN apt-get -y update

#--- sfctl ---

RUN apt-get -y install openssl libssl-dev libffi-dev \
    && apt-get -y install python3 \
    && apt-get -y install python3-pip python3-software-properties \
    && pip3 install sfctl

#--- nodejs ---
#update to nodejs10
RUN apt-get -y install gcc g++ make \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get update \
    && apt-get -y install nodejs

#--- data-plane client api ---
RUN npm install -g autorest

#--- app dev ---

#--- tools ---
RUN apt-get -y install emacs vim

# Yeoman generators for containers and guest executables
RUN npm install -g yo \
    && npm install -g generator-azuresfcontainer \
    && npm install -g generator-azuresfguest \
    && npm install -g generator-azuresfjava

# add docker cli
RUN apt-get install docker-ce-cli

# required by dotnet
RUN apt-get -y install libunwind8

#--- install servicefabric sdk ---
#---client side we dont need these--

#RUN apt-get -y install zulu-8-azure-jdk servicefabric servicefabricsdkcommon \
#    && echo "servicefabric servicefabric/accepted-eula-ga select true" | debconf-set-selections \
#    && echo "servicefabricsdkcommon servicefabricsdkcommon/accepted-eula-ga select true" | debconf-set-selections

# java dev
#RUN curl -s https://get.sdkman.io | bash \
#    && sdk install gradle 5.1


#--- cleanup ---
#RUN rm /var/cache/apt/archives/*.deb


#--- dev account ---

RUN groupadd -g 1024 dev
RUN useradd -m -u 1024 -g 1024 dev
RUN groupadd -g 999 docker
RUN usermod -aG docker dev

User dev
Workdir /home/dev

Add . .
Run cat dot_bashrc >> /home/dev/.bashrc

CMD ["/bin/bash"]
