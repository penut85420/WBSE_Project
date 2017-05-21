'use strict';

const yelp = require('yelp-fusion');
const clientId = 'Q0HKUb06nkvRsX-mf0U3aQ';

const clientSecret = 'e6QQjtfehqxvdP452QpKRNz1HwZ8BRBD4t6CeDmkLkCf0uTgDsfnL59aEz7SBr3n';
yelp.accessToken(clientId, clientSecret).then(response => {
  const client = yelp.client(response.jsonBody.access_token);

  client.reviews('gary-danko-san-francisco').then(response => {
    console.log(response.jsonBody.reviews[0].text);
  });
}).catch(e => {
  console.log(e);
});

