{{! template-lint-disable link-rel-noopener no-action require-button-type require-valid-alt-text }}
<div class="field-guide-wrapper">
  <nav class="field-guide-sidenav {{if this.showSideNav "field-guide-sidenav-always-show"}}">
    <LinkTo @route="show" @model="index" class="home-link">
      {{#if this.fieldGuideConfig.logo}}
        <img class="field-guide-logo" src={{this.fieldGuideConfig.logo}} alt="{{this.fieldGuideConfig.name}} Field Guide Logo">
      {{else}}
        <span class="field-guide-fake-logo">{{this.fieldGuideConfig.name}}</span>
      {{/if}}
      <span>
        {{#if this.fieldGuideConfig.tagLine}}
          {{this.fieldGuideConfig.tagLine}}
        {{else}}
          {{this.fieldGuideConfig.name}} Field Guide
        {{/if}}
      </span>
    </LinkTo>

    <div class="field-guide-table-of-contents">
      <TableOfContents @tocs={{this.model}} @level={{1}}/>
    </div>
  </nav>
  <div class="field-guide-wrapper-full-height">
    <main>
      {{outlet}}
      <button class="field-guide-show-sidenav" {{action (mut this.showSideNav) (not this.showSideNav)}}>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32" height="25">
          <path d="M4 10h24a2 2 0 0 0 0-4H4a2 2 0 0 0 0 4zm24 4H4a2 2 0 0 0 0 4h24a2 2 0 0 0 0-4zm0 8H4a2 2 0 0 0 0 4h24a2 2 0 0 0 0-4z"/>
        </svg>
      </button>
    </main>
    <footer class="field-guide-footer">
      <MarkdownToHtml @markdown={{this.fieldGuideConfig.copyright}} class="field-guide-footer-info" />
      <div class="field-guide-footer-right">
        <ul class="field-guide-socials">
          {{#if this.fieldGuideConfig.github}}
            <a href={{this.fieldGuideConfig.github}} title="github" target="_blank" rel="noopener">
              <img src="/icons/social/github.svg" alt="" role="presentation">
            </a>
          {{/if}}

          {{#each this.fieldGuideConfig.social as |social|}}
            <a href={{social.link}} title={{social.title}} target="_blank" rel="noopener">
              <img src="/icons/social/{{social.name}}.svg" alt="" role="presentation">
            </a>
          {{/each}}
        </ul>
        <p>
          Built with <a href="https://github.com/empress/field-guide" target="_blank" rel="noopener">Field Guide</a>
        </p>
      </div>
    </footer>
  </div>
</div>