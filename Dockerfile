FROM microsoft/aspnet:4.7.2-windowsservercore-1803

ARG site_root=.

ADD ${site_root} /inetpub/wwwroot
