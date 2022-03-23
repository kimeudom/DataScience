#import psycopg2 as psgConn
from sqlalchemy import create_engine
import pandas as pd
engine = create_engine('postgresql+psycopg2://eamiriti:Evans2037@localhost/cema')

with engine.connect() as conn:
    query = '''select  \"year\",  \"County\", \"jan\", \"feb\",\
     \"mar\", \"apr\", \"may\", \"jun\", \"jul\", \"aug\", \"sep\",\
      \"oct\", \"nov\", \"dec\", \"MaxZScore\" from \"tbMalaria\" limit 1'''
    df=pd.read_sql(query,conn)
print(df.iloc[0])