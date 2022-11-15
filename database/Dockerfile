FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE cars
ENV MYSQL_USER user
ENV MYSQL_PASSWORD user
COPY ./create_cars_table.sql /docker-entrypoint-initdb.d/cars.sql