# For more information see: http://emberjs.com/guides/routing/

Spree.App.Router.map ->
  this.route('products', { path: '/' })
  this.resource('product', { path: '/product/:slug' });