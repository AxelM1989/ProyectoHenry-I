# PROYECTO SOY HENRY - DATA04
 ## Data Engineering
 # ![image](https://user-images.githubusercontent.com/103937102/198365590-3fa64810-735a-49c5-982e-16cb75010585.png)
 

![image](https://user-images.githubusercontent.com/103937102/198366307-6021ce6b-6c6a-44db-99a8-26b59ee03b96.png)
![image](https://user-images.githubusercontent.com/103937102/198367543-b87e0cee-4791-432f-ae78-6b1143245b81.png)
![image](https://user-images.githubusercontent.com/103937102/198367300-635ff09a-de21-4bee-ba7e-6e6d33538114.png)
![image](https://user-images.githubusercontent.com/103937102/198214481-cc721b8b-75dc-49a0-8763-86af158242cd.png)

![image](https://user-images.githubusercontent.com/103937102/198214658-cc3f4e0c-4599-4e3b-94f2-f69021d550bb.png) 




 # 
 ### Axel Moriena
 #
 
### Consigna : Proceso de ETL 

En este primer proyecto individual para la carrera Data Science en Soy Henry se realizó un proceso de ETL (extract, transform and load). Se obtuvieron seis(6) datasets para luego realizar una arquitectura de datos. Procesando los archivos, efectuar limpieza y normalización de datos y posteriormente exportarlo a una base de datos.
El tiempo que se realizo el proyecto fue de dos dias.

### Ejecución:
* Los datasets están relacionados a los precios de productos de distintas cadenas de supermercado. Se contó con una tabla de productos, otra de sucursales y las cuatro restantes de precios de distintas semanas.
* Los archivos se encontraron en distintos formatos a saber "XLSX"(con dos hojas),"JSON","Parquet","csv" y "txt, entre ellos se encontraban distintos formatos en las mismas columnas.
* El proyecto fue realizado en su gran mayoría con Python, principalmente con la libreria Pandas. De esta manera fue efectuada la limpieza y unificación de los distintos archivos. Se concatenó en una sola tabla todos los precios semanales, y para ello se agregó una columna con la información de la semana ya que los precios se van actualizando.
* Por último fueron exportados los archivos a una base de datos. En este caso se utilizó MySQL, generando un Modelo Entidad-Relación. 
* Desde la base de datos de MySQL se realizó una tabla de auditoria que a través de un Trigger, nos indique cuando se actualicen los datos de la tabla de precios semanales y nos devuelva el producto, el usuario que ingresó la actualización y la fecha y hora en que se realizó la misma.

### El siguiente es el diagrama de flujo realizado.
![image](https://github.com/AxelM1989/ProyectoHenry-I/blob/main/DiagramaDeFlujo.jpg)


### Consideraciones a tener en cuenta.

* El link del Repositorio al GitHub personal donde se encuentran los scripts es https://github.com/AxelM1989/ProyectoHenry-I
* Allí se va a encontrar:
* Un archivo "CargaDatosCSV.ipynb", que contiene el notebook formato "ipynb" en el cual se encuentran todos los scripts de limpieza, normalización y carga de datos.
* Otro notebook "UnificacionPreciosSemana.ipynb" que contiene todos los datos relacionados a la unificación de las tablas de precios semanales, indicando a cual de ellas pertenece.
* Archivo de consultas en SQL "PIHenry.sql" y "PIHenry.db" correspondientes a la base de datos utilizada.
* Y por último el "README.md" y el "DiagramadeFlujo.jpg" contenientes de este archivo.
* También dejo un video en youtube que debiamos presentar y no podía sobrepasar los 5 minutos de explicación. https://www.youtube.com/watch?v=ZvoZ90MF2FU&t=10s

En sintesis?


