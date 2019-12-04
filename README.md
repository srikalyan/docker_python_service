# Docker Python Service

Provides the Base docker image for various python microservices.

This docker image provides three different groups of tags
1. latest: latest build from master
2. release: semantic version of the tag indicating release e.g., 1.0.0
3. latest-stable: Latest release that is tested so that apps don't have to do a manual migrate.

NOTE: One must set APP_NAME in the env variable to run the docker image by default using uwsgi.