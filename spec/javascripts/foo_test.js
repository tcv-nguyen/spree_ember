module("Faking response data", {
    setup: function () {
      var testData = { products: { id: 1, name: 'Ruby on Rails Tote' } };
      this.server = sinon.fakeServer.create();
      this.server.respondWith("GET", "/api/products.json", [200, { "Content-Type": "application/json" }, JSON.stringify(testData)]);
    },
    teardown: function () {
      this.server.restore();
    }
});

test("root lists first page of posts", function(){
  ok( 1 == "1", "Passed!" );
  visit("/");
  andThen(function() {
    console.log("OK")
  })
});
