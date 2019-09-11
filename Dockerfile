FROM arm32v7/python as build

# Setup build dependencies
RUN apt update
RUN apt install -y python3-dev gcc libsqlite3-mod-spatialite

RUN pip install datasette

FROM arm32v7/python

# Copy python dependencies
COPY --from=build /usr/local/lib/python3.7/site-packages /usr/local/lib/python3.7/site-packages
# Copy executables
COPY --from=build /usr/local/bin /usr/local/bin
# Copy spatial extensions
#COPY --from=build /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu

EXPOSE 8001
CMD ["datasette"]