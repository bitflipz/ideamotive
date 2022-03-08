# Ideamotive - Zadanie Rekrutacyjne

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

https://docs.google.com/spreadsheets/d/1MuF8Nk0XEXz8HUWNhlRGLBpxmAFtQLFv5lzFEoQBIy8/edit?usp=sharing




https://datastudio.google.com/reporting/b843d48c-4f26-4cad-8afc-c0f79aba03b4
