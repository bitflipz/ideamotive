# Ideamotive - Zadanie Rekrutacyjne

### Część Python (json -> csv + preparing data)
[![jupyter](https://github.com/janobyte/ideamotive/blob/main/scrs/jptr.png "jupyter")](https://github.com/janobyte/ideamotive/blob/main/jsontocsv.ipynb)

Ta część była zerobiona w Jupyterze więć lepsze widoczność będzie jak się wejdzie w [link](https://github.com/janobyte/ideamotive/blob/main/jsontocsv.ipynb).
```python
import pandas as pd
import requests
import json

url = requests.get("https://data.nasa.gov/resource/gh4g-9sfh.json")
text = url.text
data = json.loads(text)

df = pd.read_json(text)
df = pd.json_normalize(data)
df.info()
df = df.rename(columns = {'geolocation.latitude':'latitude','geolocation.longitude':'longtitude'})
df = df.drop(columns=[':@computed_region_cbhk_fwbd', ':@computed_region_nnqa_25f4'])
df = df.drop(columns=['latitude', 'longtitude'])
df = df.dropna()
df.reset_index(drop=True,inplace=True)

df.to_csv('output.csv', index=False)
```
### Część w Google Sheets
[![gsheets](https://github.com/janobyte/ideamotive/blob/main/scrs/gsheets.png "gsheets")](https://docs.google.com/spreadsheets/d/1MuF8Nk0XEXz8HUWNhlRGLBpxmAFtQLFv5lzFEoQBIy8/edit?usp=sharing)

### Część SQL
Kod:
```sql
select count(distinct recclass) AS 'unique class' from meteor;

select avg(mass) as 'avg mass', recclass as 'class'
from meteor
group by recclass;

select avg(mass) as 'avg mass', recclass as 'class'
from meteor
group by recclass
having avg(mass)<5000
order by avg(mass) DESC;
```
Output:
![sqloutput](https://github.com/janobyte/ideamotive/blob/main/scrs/sql-screen.png "sqlscr")


https://datastudio.google.com/reporting/b843d48c-4f26-4cad-8afc-c0f79aba03b4
