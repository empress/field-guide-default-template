import Component from '@glimmer/component';
import { htmlSafe } from '@ember/template';
import capitalize from 'field-guide-default-template/helpers/capitalize';
import TableOfContents from 'field-guide-default-template/components/table-of-contents';
import inc from 'field-guide-default-template/helpers/inc';
import { LinkTo } from '@ember/routing';

export default class TableOfContentsComponent extends Component {
  <template>
    {{! template-lint-configure no-inline-styles {"allowDynamicStyles": true} }}
    <ul class="field-guide-toc">
      {{#each this.sortedTocs as |toc|}}
        {{#if toc.pages}}
          <li class="field-guide-toc-item">
            <span style={{this.leftPadStyle}}>
              {{capitalize toc.title}}
            </span>
            <TableOfContents @tocs={{toc.pages}} @level={{inc @level}} />
          </li>
        {{else}}
          <LinkTo @route="show" @model={{toc.id}}>
            <li
              class="field-guide-toc-item field-guide-toc-item-link"
              style={{this.leftPadStyle}}
            >
              {{capitalize toc.title}}
            </li>
          </LinkTo>
        {{/if}}
      {{/each}}
    </ul>
  </template>

  get leftPadStyle() {
    return htmlSafe(`padding-left:${this.args.level}em;`);
  }

  get sortedTocs() {
    return this.args.tocs.sort((a, b) => {
      // index a the top always
      if (a.title === 'index' && b.title !== 'index') {
        return -1;
      }

      if (b.title === 'index' && a.title !== 'index') {
        return 1;
      }

      return a.title.localeCompare(b.title);
    });
  }
}
