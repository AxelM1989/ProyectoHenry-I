# PROYECTO SOY HENRY - DATA04
 ## Axel Moriena - PI01_DATA_ENGINEERING
 
 # ![image](https://user-images.githubusercontent.com/103937102/198365590-3fa64810-735a-49c5-982e-16cb75010585.png)
 

![image](https://user-images.githubusercontent.com/103937102/198366307-6021ce6b-6c6a-44db-99a8-26b59ee03b96.png)
![image](https://user-images.githubusercontent.com/103937102/198367543-b87e0cee-4791-432f-ae78-6b1143245b81.png)
![image](https://user-images.githubusercontent.com/103937102/198367300-635ff09a-de21-4bee-ba7e-6e6d33538114.png)

![image](https://user-images.githubusercontent.com/103937102/198214481-cc721b8b-75dc-49a0-8763-86af158242cd.png)
![image](https://user-images.githubusercontent.com/103937102/198214658-cc3f4e0c-4599-4e3b-94f2-f69021d550bb.png) 




 

 #
 
### Consigna : Proceso de ETL 

En este primer proyecto individual para la carrera de Data Science en Soy Henry, se realizó un proceso de ETL (extract, transform and load). Se obtuvieron seis(6) datasets para luego realizar una arquitectura de datos. 
Procesar los archivos, efectuar limpieza, normalización de datos y posteriormente exportar a una base de datos fue la tarea general del proyecto para este Pipeline.
El tiempo en que se realizo el mismo fue de tres dias.

### Ejecución:
* Los datasets están relacionados a los precios de productos de distintas cadenas de supermercado distribuidos por semanas. Se contó con una tabla de productos, otra de sucursales y las cuatro restantes de precios de distintas semanas.
* Los archivos se encontraron en distintos formatos a saber; "XLSX"(con dos hojas),"JSON","Parquet","csv" y "txt, entre ellos se encontraron distintos formatos para datos similares en las mismas columnas.
* El proyecto fue realizado en su gran mayoría con Python, principalmente con la libreria Pandas. De esta manera fue efectuada la limpieza y unificación de los distintos archivos. Se concatenó en una sola tabla todos los precios semanales de cada producto y sucursal, y para ello se agregó una columna con la información de la semana, ya que los precios se van actualizando.
* Consiguientemente fueron exportados los archivos a una base de datos. En este caso se utilizó MySQL, generando un Modelo Entidad-Relación. 
* Desde la base de datos de MySQL se realizó una tabla de auditoria que a través de un Trigger (disparador), indique cuando se actualicen los datos de la tabla de precios semanales y nos devuelva el producto, el usuario que ingresó la actualización y la fecha y hora en que se realizó la misma.
* Importante aclaración al respecto, en el video de Youtube (que mas abajo comento) no mostré la consulta que se realizó en la tabla de Auditoria. Para ello, en este mismo repositorio, en la carpeta asset, está la captura de pantalla de la misma (para un solo ingreso de actualización de datos) --->
https://github.com/AxelM1989/ProyectoHenry-I/blob/main/asset/RegistroTablaAuditoria.png


### El siguiente es el diagrama de flujo realizado.
![image](https://github.com/AxelM1989/ProyectoHenry-I/blob/main/DiagramaDeFlujo.jpg)


### Consideraciones a tener en cuenta.

* El link del Repositorio al GitHub personal donde se encuentran los scripts es https://github.com/AxelM1989/ProyectoHenry-I
* Allí se va a encontrar:
* Un archivo "CargaDatosCSV.ipynb", que contiene el notebook formato "ipynb" en el cual se encuentran todos los scripts de limpieza, normalización y carga de datos.
* Otro notebook "UnificacionPreciosSemana.ipynb" que contiene los datos relacionados a la unificación de las tablas de precios semanales, indicando a cual de ellas pertenece.
* Archivo de consultas en SQL "PIHenry.sql" y "PIHenry.db", esta ultima correspondiente a la base de datos utilizada.
* "Incremental.py" consistente en la automatización de limpieza de fuentes de datos cargadas con el formato del archivo "precios_semana_20200518.txt", para que en el caso de realizarse algún cambio en él, sea capaz de llamar al script nuevamente, o si se encuentra un nuevo datasets con este mismo formato involucrando a precios de nuevas semanas, se pueda realizar automáticamente los cambios para poder subirse las actualizaciones a la base de datos de MySQL.
* También el "README.md" y el "DiagramadeFlujo.jpg" contenientes de este archivo.
* Por último, dejo un link de video en youtube que debiamos presentar y no podía sobrepasar los 5 minutos de explicación. https://www.youtube.com/watch?v=ZvoZ90MF2FU&t=10s
* Muchas gracias.




