'use strict';
const Funnel = require('broccoli-funnel');
const { join } = require('path');

module.exports = {
  name: require('./package').name,

  treeForPublic() {
    return new Funnel(join(this.root, 'public'));
  },

  contentFor(type, config) {
    if (type === 'head') {
      if (!config['field-guide'] || !config['field-guide'].logo) {
        return '<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great&display=swap" rel="stylesheet">';
      }
    }
  },
};
