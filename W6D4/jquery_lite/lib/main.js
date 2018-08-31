const DOMNodeCollection = require('./dom_node_collection.js');

const $l = function(input) {
  if (typeof input === 'function'){
    document.addEventListener("DOMContentLoaded", input);
  } else if (input instanceof HTMLElement) {
    return new DOMNodeCollection([input]);
  } else if (typeof input === 'string') {
    const list = Array.from(document.querySelectorAll(input));
    return new DOMNodeCollection(list);
  }

};

$l.extend = function(...objs) {
  if (objs.length <= 1) { return null; }
  const obj = objs[0];
  for (var i = 1; i < objs.length; i++) {
    for (let key in objs[i]) {
      obj[key] = objs[i][key];
    }
  }
  return obj;
};

$l.ajax = function(options) {
  const request = new XMLHttpRequest();

  const defaultOptions = {
    contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
    data: {},
    error: (res) => { console.log('Error!', res); },
    method: 'GET',
    success: (res) => { console.log('Success!', res); },
    url: 'https://api.giphy.com/v1/gifs/random?tag=puppies&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G',
  };

  options = $l.extend(defaultOptions, options);

  request.open(options.method, options.url, true);
  request.onload = function () {
    console.log(request.status);
    console.log(request.responseType);
    console.log(request.response);
  };

  // request.setRequestHeader('Access-Control-Allow-Origin', '*');
  request.send(JSON.stringify(options.data));
};

window.$l = $l;

$l( () => {
  console.log('document loaded');
  $l('li').on('click', ()=>{console.log('click');});
});
