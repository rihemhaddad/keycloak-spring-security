import { AppPage } from './app.po';
import {browser, by, element} from 'protractor';

describe('workspace-project App', () => {
  let page: AppPage;

  beforeEach(() => {
    page = new AppPage();
  });

  it('should redirect to keycloak for login', async () => {
    browser.waitForAngularEnabled(false);
    await page.navigateTo();
    expect(await browser.getCurrentUrl()).toContain('localhost:8080/auth/realms/FRONT');
    await element(by.id('username')).sendKeys('front-1');
    await element(by.id('password')).sendKeys('password');
    await element(by.id('kc-login')).click();

    expect(await browser.getCurrentUrl()).toEqual('http://localhost:4200/');
    await browser.sleep(500);
    expect(await element.all(by.css('h1')).getText()).toEqual([ 'Client publique keycloak' ]);
  });

  it('should not see admin page and see producer page', async () => {
    browser.waitForAngularEnabled(false);
    await page.navigateTo();
    expect(await browser.getCurrentUrl()).toContain('localhost:8080/auth/realms/FRONT');
    await element(by.id('username')).sendKeys('front-1');
    await element(by.id('password')).sendKeys('password');
    await element(by.id('kc-login')).click();

    expect(await browser.getCurrentUrl()).toEqual('http://localhost:4200/');
    await browser.sleep(500);
    await element(by.id('admin')).click();
    expect(await browser.getCurrentUrl()).toEqual('http://localhost:4200/interdit');

    await element(by.id('producer')).click();
    expect(await browser.getCurrentUrl()).toEqual('http://localhost:4200/producteur');

  });

  it('should see admin page and not see producer page', async () => {
    browser.waitForAngularEnabled(false);
    await page.navigateTo();
    expect(await browser.getCurrentUrl()).toContain('localhost:8080/auth/realms/FRONT');
    await element(by.id('username')).sendKeys('front-2');
    await element(by.id('password')).sendKeys('password');
    await element(by.id('kc-login')).click();

    expect(await browser.getCurrentUrl()).toEqual('http://localhost:4200/');
    await browser.sleep(500);

    await element(by.id('admin')).click();
    expect(await browser.getCurrentUrl()).toEqual('http://localhost:4200/admin');

    await element(by.id('producer')).click();
    expect(await browser.getCurrentUrl()).toEqual('http://localhost:4200/interdit');

  });

  afterEach(async () => {
    await element(by.id('btn-logout')).click();
  });

});
