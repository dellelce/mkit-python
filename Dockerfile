ARG PROFILE=python

FROM ghcr.io/dellelce/mkit-base as build
ARG PROFILE

RUN bash -x ./mkit.sh profile=$PROFILE /app/$PROFILE

FROM alpine:3.8 as target

COPY --from=build /app/$PROFILE /app/$PROFILE
