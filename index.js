'use strict';

module.exports = {
  name: require('./package').name,

  contentFor(type, config) {
    if (type === 'head') {
      if(!config['field-guide'] || !config['field-guide'].logo) {
        return '<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great&display=swap" rel="stylesheet">';
      }
    }
  }
};
