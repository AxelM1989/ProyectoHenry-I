import pandas as pd 
import os
import re
from ruta import *

def incremental(path):
    semana1805 = pd.read_csv(f'{path}',  sep= '|')
    semana1805 = semana1805["precio|producto_id|sucursal_id"].str.split(
    "|", expand=True)
    semana1805 = semana1805.rename(
    columns={0: "Precio", 1: "IdProducto", 2: "IdSucursal"})
    semana1805['IdSucursal']=semana1805['IdSucursal'].apply(lambda x: x.replace('-',''))
    semana1805["IdSucursal"]=semana1805["IdSucursal"].fillna(0)
    semana1805["IdSucursal"]=semana1805["IdSucursal"].str.zfill(8)
    semana1805=semana1805.reindex(columns=["IdProducto","IdSucursal","Precio"])
    semana1805["Precio"]=pd.to_numeric(semana1805["Precio"],errors="coerce")
    semana1805["Precio"]=semana1805["Precio"].fillna(0)
    semana1805.to_csv("Semana1805.csv",index=False)
    semana1805= os.path.split(path)[1]
    semana1805.to_sql('precio', Connection, if_exists='append', index=False)

incremental(r"D:\Axel\Trabajo\Curso\Data Science - Soy Henry\Proyecto Individual I - ETL-\precios_semana_20200518.txt")