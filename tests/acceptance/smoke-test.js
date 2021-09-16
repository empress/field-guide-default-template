import { module, test } from 'qunit';
import { visit } from '@ember/test-helpers';
import { setupApplicationTest } from 'ember-qunit';
import fetch from 'fetch';

function getAllPageUrls(page, urls = []) {
  const { pages, id } = page;

  if (!pages || !pages.length) {
    urls.push(id);
  }

  if (pages) {
    for (let subPage of pages) {
      getAllPageUrls(subPage, urls);
    }
  }

  return urls;
}

module('Acceptance | smoke test', function (hooks) {
  setupApplicationTest(hooks);

  test('visiting every page in the app', async function (assert) {
    assert.expect(0);

    let toc = await fetch('/toc.json');
    let tocObject = await toc.json();

    console.log(tocObject);

    const urls = tocObject.reduce((urls, page) => {
      return urls.concat(getAllPageUrls(page));
    }, []);

    for (let url of urls) {
      await visit(url);
    }
  });
});
