# What is it

Docker sample app using ASP.NET 4.7 and Windows Server 1803 containers. Shows container hostname on webpage. This is a simple fork of [this hostname app](https://github.com/sixeyed/presentations/tree/master/docker-webinars/windows-101-to-mta/part-1/hostname-app).

# Requirements

Per the [Microsoft Container Version Compatibility](https://docs.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/version-compatibility):
- Host OS:
  - Windows Server version 1803 Builds 17134
  - Or, Windows 10 version 1803 Builds 17134

# Build the Docker image

**NOTE**: Pre-built images available on Docker Hub: https://hub.docker.com/r/derrickdocker/hostname-app/.

## Pull an existing image

```PS C:\> docker pull derrickdocker/hostname-app:windowsservercore-1803```

## Build your own image

```PS C:\> git clone https://github.com/millerdz/hostname-app
PS C:\> cd hostname-app
PS C:\> docker image build -t my-asp-site .
```

# Run the Docker image

## Recently pulled Docker image on Windows Server 1803

```PS C:\> docker run -d -p 8080:80 derrickdocker/hostname-app:windowsservercore-1803```

## Recently built Docker image on Windows Server 1803

```PS C:\> docker run -d -p 8080:80 my-asp-site```

## Recently pulled Docker image on Windows 10 version 1803

```PS C:\> docker run -d -p 8080:80 --isolation=hyperv derrickdocker/hostname-app:windowsservercore-1803```

## Recently built Docker image on Windows 10 version 1803

```PS C:\> docker run -d -p 8080:80 --isolation=hyperv my-asp-site```

# View the webpage

Open your browser and go to http://localhost:8080

![](example_web_page.png)

# Deploy to Docker Enterprise and use Layer 7 Routing

**NOTE**: Make sure to update `com.docker.lb.hosts` in `docker-compose-docker-ee.yml` with your actual domain you have configured. 

```# Source env.ps1 from UCP client bundle
PS C:\> docker stack deploy --orchestrator swarm -c docker-compose-docker-ee.yml hostnameapp
```

Once deployed, navigate to the URL configured for `com.docker.lb.hosts`, for example, http://apps-win.example.org, to access the application. 

