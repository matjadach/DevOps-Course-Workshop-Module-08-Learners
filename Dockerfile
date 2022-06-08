FROM mcr.microsoft.com/dotnet/sdk:6.0
RUN apt-get update && apt-get install -y build-essential
RUN  curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
COPY . /opt
WORKDIR /opt
RUN dotnet build
WORKDIR /opt/DotnetTemplate.Web
RUN npm install
RUN npm rebuild node-sass
RUN npm run build
EXPOSE 5000
ENTRYPOINT ["dotnet", "run"]