# Response Test Set Global Variable 

``` javascript
const response = pm.response.text();
const { groups: { token } } = /TOKEN:(?<token>[\w-]*)/g.exec(response)
pm.globals.set("token", token);
```