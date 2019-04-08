var inspect = require('util').inspect;

process.env.NODE_ENV = 'stg';

var should = require('chai').should(),
    expect = require('chai').expect,
    supertest = require('supertest'),
    config = require('config'),
    api_mail =  supertest('https://api.temp-mail.org/request'),
    cheerio = require('cheerio');


var datos = config.get('Datos');

var api = supertest(datos.api_url);
var md5 = require('md5');

describe('TEST APIREST', function () {

  beforeEach(function(done) {
    console.log('---------------------------------------');
    done();
  });

  it('POST /XXX/xxxx - TestCase', function (done) {
    this.timeout(10 * 1000);
    api.post('/XXX/xxxx')
      .set('clientToken', clientToken)
      .send({
        parametro1: valor1,
        parametro2: 'valor1',
      })
      .expect(200)
      .end(function (err, res) {
        console.log(res.body);
        res.status.should.be.equal(201);
        done();
      });
  });

  it('GET xxxx - TestCase', function (done) {
    this.timeout(10 * 1000);
    api.get('/xxxx')
      .set('clientToken', clientToken)
      .query({parametro1:'value1', parametro2: value2})
      .expect(200)
      .end(function (err, res) {
        res.status.should.be.equal(200);
        done();
      });
  });

});
