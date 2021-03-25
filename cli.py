#requests is a requirment that needs to me installed (module requests)
import requests
r = requests.get('https://github.com/kennethreitz/requests/blob/master/README.rst')
print(r.text)
