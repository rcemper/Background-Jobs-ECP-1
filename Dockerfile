ARG IMAGE=intersystemsdc/iris-community:latest
ARG IMAGE=containers.intersystems.com/intersystems/iris:2022.1.0.209.0
FROM $IMAGE

USER root
COPY  ECP_iris.key /usr/irissys/mgr/iris.key

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp
COPY irissession.sh /
RUN chmod +x /irissession.sh 

# USER irisowner
USER ${ISC_PACKAGE_MGRUSER}  
COPY  Installer.cls .
COPY  src src
SHELL ["/irissession.sh"]
RUN \
  do $SYSTEM.OBJ.Load("Installer.cls", "ck") \
  set sc = ##class(App.Installer).setup() 

# bringing the standard shell back
SHELL ["/bin/bash", "-c"]
CMD [ "-l", "/usr/irissys/mgr/messages.log" ]
