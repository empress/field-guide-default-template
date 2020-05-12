'use strict';
const Funnel = require('broccoli-funnel');
const mergeTrees = require('broccoli-merge-trees');

module.exports = {
  name: require('./package').name,

  treeForPublic(tree) {
    var assetsTree = new Funnel('tests/dummy/public');
    return mergeTrees([tree, assetsTree], {
      overwrite: true
    });
  },

  contentFor(type, config) {
    if (type === 'head') {
      if(!config['field-guide'] || !config['field-guide'].logo) {
        return '<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great&display=swap" rel="stylesheet">';
      }
    }
  }
};
