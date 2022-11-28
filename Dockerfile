FROM apache/superset:2.0.0
# Switching to root to install the required packages
USER root
# Install the Postgres driver to connect to the metadata database
RUN pip install psycopg2-binary
# Switching back to using the `superset` user
USER superset
# Add configuration
COPY superset_config.py .

CMD superset run -p $PORT --with-threads --reload --debugger --host=0.0.0.0
