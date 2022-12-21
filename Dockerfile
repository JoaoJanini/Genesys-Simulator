# build from ubuntu image
FROM ubuntu:latest

RUN echo "Atualizando pacotes e instalando dependencias"
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install build-essential git #gcc g++ 
RUN apt-get -y install libqt5gui5
RUN echo "Clonando repositorio do GenESyS"
# Create a  directory and copy the genesys source code
RUN mkdir /Genesys-Simulator
COPY ./source /Genesys-Simulator/source
COPY ./projects /Genesys-Simulator/projects
COPY ./temp /Genesys-Simulator/temp

RUN echo "Compilando e executando aplicacao em terminal do GenESyS"
# TURN GENESYS INTO WORKING DIRECTORY
WORKDIR /Genesys-Simulator/projects/GenesysTerminalApplication
# Compile with qmake
RUN make QMAKE=/usr/lib/x86_64-linux-gnu/qt5/bin/qmake

WORKDIR /Genesys-Simulator

COPY ./models /Genesys-Simulator/projects
COPY ./.dep.inc /Genesys-Simulator/
COPY ./.directory /Genesys-Simulator/
COPY ./documentation /Genesys-Simulator/documentation
COPY ./scripts/ /Genesys-Simulator/scripts/



# RUN dist/genesysterminalapplication

# ALLOW IT TO BE EXECUTED WITH BASH
# WORKDIR /Genesys-Simulator/source/applications/gui/qt/GenesysQtGUI/build-GenesysQtGUI-Desktop-Debug
# RUN echo "Compilando e executando aplicacao grafica do GenESyS"

# # Recompile with qmake based on changes
# RUN make QMAKE=/usr/lib/x86_64-linux-gnu/qt5/bin/qmake
# Run the application

# RUN ./GenesysQtGUI