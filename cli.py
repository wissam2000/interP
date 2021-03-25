#requests is a requirment that needs to me installed (module requests)
import requests
url = 'https://github.com/peaudecastor/data-converter-take-home-test/blob/main/sample.json'
r = requests.get(url)#, headers={'accept': 'application/json'})

print(r.json())
