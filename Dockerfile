ARG PROFILE=python

FROM ghcr.io/dellelce/mkit-base as build
ARG PROFILE

RUN ./mkit.sh profile=$PROFILE /app/$PROFILE

FROM alpine:3.19 as target

COPY --from=build /app/$PROFILE /app/$PROFILE
