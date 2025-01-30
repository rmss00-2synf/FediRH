# Utilisation de l'image Oracle Database Enterprise Edition 21c
FROM container-registry.oracle.com/database/enterprise:21.3.0.0

USER root

# Mettre à jour les paquets et installer les bibliothèques nécessaires
RUN yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
RUN yum install -y postgresql14-server
RUN yum install -y postgresql14-odbc
RUN systemctl enable postgresql-14


# Vérifier l'installation du pilote ODBC PostgreSQL
RUN ls -l /usr/pgsql-14/lib/psqlodbc.so

# Ajouter la configuration ODBC
RUN echo "[DS_PostgreSQL]" > /etc/odbc.ini && \
    echo "Description=POSTGRES" >> /etc/odbc.ini && \
    echo "Driver=/usr/pgsql-14/lib/psqlodbc.so" >> /etc/odbc.ini && \
    echo "Servername=postgres-db" >> /etc/odbc.ini && \
    echo "Port=5438" >> /etc/odbc.ini && \
    echo "Database=federation_db_postgres" >> /etc/odbc.ini && \
    echo "username=admin_marjand_tanger" >> /etc/odbc.ini && \
    echo "password=password" >> /etc/odbc.ini

# Configuration Oracle pour la connexion à PostgreSQL
RUN echo "HS_FDS_CONNECT_INFO = DS_PostgreSQL" > $ORACLE_HOME/hs/admin/initINST_PostgreSQL.ora && \
    echo "HS_FDS_SHAREABLE_NAME = /usr/pgsql-14/lib/psqlodbc.so" >> $ORACLE_HOME/hs/admin/initINST_PostgreSQL.ora && \
    echo "HS_LANGUAGE=AMERICAN_AMERICA.WE8ISO8859P1" >> $ORACLE_HOME/hs/admin/initINST_PostgreSQL.ora && \
    echo "set ODBCINI=/etc/odbc.ini" >> $ORACLE_HOME/hs/admin/initINST_PostgreSQL.ora

# Modification du fichier listener.ora
#RUN sed -i '/SID_LIST_LISTENER =/a \
#    (SID_DESC = \
#      (PROGRAM = dg4odbc) \
#      (SID_NAME = INST_PostgreSQL) \
#      (ORACLE_HOME = /opt/oracle) \
#    )' $ORACLE_HOME/network/admin/listener.ora && \
#    lsnrctl reload

RUN mkdir -p $ORACLE_HOME/network/admin && \
    touch $ORACLE_HOME/network/admin/listener.ora && \
    echo "SID_LIST_LISTENER =" >> $ORACLE_HOME/network/admin/listener.ora && \
    sed -i '/SID_LIST_LISTENER =/a \
        (SID_DESC = \
        (PROGRAM = dg4odbc) \
        (SID_NAME = INST_PostgreSQL) \
        (ORACLE_HOME = /opt/oracle) \
        )' $ORACLE_HOME/network/admin/listener.ora && \
    lsnrctl reload



#RUN test -f $ORACLE_HOME/network/admin/listener.ora && \
#    sed -i '/SID_LIST_LISTENER =/a \
#        (SID_DESC = \
#        (PROGRAM = dg4odbc) \
#        (SID_NAME = INST_PostgreSQL) \
#        (ORACLE_HOME = /opt/oracle) \
#        )' $ORACLE_HOME/network/admin/listener.ora
#    lsnrctl reload || echo "listener.ora not found, skipping modification."

# Ajout de PostgreSQL dans tnsnames.ora
#RUN echo "TNS_PostgreSQL =" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "  (DESCRIPTION =" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "    (ADDRESS_LIST =" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "      (ADDRESS = (PROTOCOL = TCP)(HOST = oracle-db)(PORT = 1521))" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "    )" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "    (CONNECT_DATA =" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "      (SID = INST_PostgreSQL)" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "    )" >> $ORACLE_HOME/network/admin/tnsnames.ora && \
#    echo "  )" >> $ORACLE_HOME/network/admin/tnsnames.ora

# Redémarrage du listener
#RUN lsnrctl reload && \
#    tnsping TNS_PostgreSQL

# Création du script SQL pour configurer le lien de base de données
#RUN echo "DROP DATABASE LINK postgres_dblink;" > /docker-entrypoint-initdb.d/init.sql && \
#    echo "CREATE DATABASE LINK postgres_dblink CONNECT TO \"postgres_user\" IDENTIFIED BY \"password\" USING 'TNS_PostgreSQL';" >> /docker-entrypoint-initdb.d/init.sql && \
#    echo "CREATE SYNONYM test_postgres_dblink FOR \"test\"@postgres_dblink;" >> /docker-entrypoint-initdb.d/init.sql

USER oracle
