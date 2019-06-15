import Component from '@ember/component';
import layout from '../templates/components/table-of-contents';
import { computed } from '@ember/object';

export default Component.extend({
  layout,
  tagName: '',

  sortedTocs: computed('tocs', function() {
    return this.tocs.sort((a, b) => {
      // index a the top always
      if(a.title === 'index' && b.title !== 'index') {
        return -1;
      }

      if(b.title === 'index' && a.title !== 'index') {
        return 1;
      }

      return a.title.localeCompare(b.title);
    });
  })
});
