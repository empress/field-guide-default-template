import RouteTemplate from 'ember-route-template';
import { LinkTo } from '@ember/routing';
import TableOfContents from 'field-guide-default-template/components/table-of-contents';
import not from 'field-guide-default-template/helpers/not';
import MarkdownToHtml from 'ember-cli-showdown/components/markdown-to-html';
import { on } from '@ember/modifier';
import { fn } from '@ember/helper';

export default RouteTemplate(
  <template>
    {{! template-lint-disable link-rel-noopener no-action require-button-type require-valid-alt-text }}
    <div class="field-guide-wrapper">
      <nav
        class="field-guide-sidenav
          {{if @controller.showSideNav 'field-guide-sidenav-always-show'}}"
      >
        <LinkTo @route="show" @model="index" class="home-link">
          {{#if @controller.fieldGuideConfig.logo}}
            <img
              class="field-guide-logo"
              src={{@controller.fieldGuideConfig.logo}}
              alt="{{@controller.fieldGuideConfig.name}} Field Guide Logo"
            />
          {{else}}
            <span
              class="field-guide-fake-logo"
            >{{@controller.fieldGuideConfig.name}}</span>
          {{/if}}
          <span>
            {{#if @controller.fieldGuideConfig.tagLine}}
              {{@controller.fieldGuideConfig.tagLine}}
            {{else}}
              {{@controller.fieldGuideConfig.name}}
              Field Guide
            {{/if}}
          </span>
        </LinkTo>

        <div class="field-guide-table-of-contents">
          <TableOfContents @tocs={{@controller.model}} @level={{1}} />
        </div>
      </nav>
      <div class="field-guide-wrapper-full-height">
        <main>
          {{outlet}}
          <button
            class="field-guide-show-sidenav"
            {{on
              "click"
              (fn (mut @controller.showSideNav) (not @controller.showSideNav))
            }}
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 32 32"
              height="25"
            >
              <path
                d="M4 10h24a2 2 0 0 0 0-4H4a2 2 0 0 0 0 4zm24 4H4a2 2 0 0 0 0 4h24a2 2 0 0 0 0-4zm0 8H4a2 2 0 0 0 0 4h24a2 2 0 0 0 0-4z"
              />
            </svg>
          </button>
        </main>
        <footer class="field-guide-footer">
          <MarkdownToHtml
            @markdown={{@controller.fieldGuideConfig.copyright}}
            class="field-guide-footer-info"
          />
          <div class="field-guide-footer-right">
            <ul class="field-guide-socials">
              {{#if @controller.fieldGuideConfig.github}}
                <a
                  href={{@controller.fieldGuideConfig.github}}
                  title="github"
                  target="_blank"
                  rel="noopener"
                >
                  <img src="/icons/social/github.svg" alt />
                </a>
              {{/if}}

              {{#each @controller.fieldGuideConfig.social as |social|}}
                <a
                  href={{social.link}}
                  title={{social.title}}
                  target="_blank"
                  rel="noopener"
                >
                  <img src="/icons/social/{{social.name}}.svg" alt />
                </a>
              {{/each}}
            </ul>
            <p>
              Built with
              <a
                href="https://github.com/empress/field-guide"
                target="_blank"
                rel="noopener"
              >Field Guide</a>
            </p>
          </div>
        </footer>
      </div>
    </div>
  </template>,
);
