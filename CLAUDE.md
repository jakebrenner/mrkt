# MRKT Brand Audit Generator

This project generates branded marketing audit landing pages for MRKT (getmrkt.com) prospective clients. Each audit is a self-contained HTML file deployed to Vercel at review.getmrkt.com/{brand-slug}.

## Project Structure

```
mrkt-audits/
├── CLAUDE.md              ← you are here
├── vercel.json            ← routing config
├── index.html             ← redirects to getmrkt.com
├── template/
│   └── reference.html     ← the master template (Hairprint example)
└── audits/
    ├── hairprint.html
    └── {brand-slug}.html  ← new audits go here
```

## Brand System

### Colors

| Token      | Hex       | Usage                                              |
|------------|-----------|-----------------------------------------------------|
| Navy       | #253551   | Headers, dark sections, footer, nav buttons          |
| Gold       | #FFC905   | Accent underlines, badges, highlights, section numbers |
| Light Gray | #F2F2F2   | Page background, alternating sections                |
| Black      | #000000 / #1a1a1a | Body text                                  |
| White      | #FFFFFF   | Cards, light sections                                |

### Fonts (Google Fonts)

* Headlines: 'Young Serif', serif — weight 400
* Body: 'Bitter', serif — weights 400, 500, 600, 700

### Logo

Text-only: "MRKT" rendered in Young Serif, letter-spacing: 2px, white on navy background.

## Generating a New Audit

When asked to create a new brand audit, follow these steps:

### 1. Required Inputs

* Brand name (e.g., "Hairprint")
* Website URL (e.g., "https://www.myhairprint.com/")
* Raw audit content (the analysis text — can be rough notes)
* Loom embed URL (optional — use placeholder if not provided)

### 2. File Naming

Convert brand name to lowercase kebab-case for the filename:

* "Hairprint" → `audits/hairprint.html`
* "Acme Supplements" → `audits/acme-supplements.html`
* "The Baked Bear" → `audits/the-baked-bear.html`

### 3. HTML Structure

Every audit page MUST include these elements in this order:

```
1. Top Bar           — Navy bar with "MRKT" logo linking to getmrkt.com
2. Hero              — Dark gradient, brand name as h1, subtitle, website link
3. Sticky CTA Bar    — Persistent navy bar with "Let's Chat" mailto button
4. Video Section     — Loom iframe embed (or placeholder if no URL)
5. Executive Summary — Overview with highlights + key opportunities
6. Table of Contents — Numbered anchor links to each section
7. Audit Sections    — Numbered sections with the actual audit content
8. Final Verdict    — Dark gradient section with summary + CTA
9. CTA Section      — White section with final "Let's Chat" CTA
10. Footer          — Navy footer with MRKT logo + links
```

### 4. Section Component Reference

Use these components to structure audit content:

**Executive Summary** — overview section with highlights and opportunities:
```html
<section class="exec-summary" id="executive-summary">
  <div class="container">
    <h2>Executive Summary</h2>
    <div class="gold-line"></div>
    <p class="exec-intro">Overview paragraph...</p>

    <div class="exec-highlights">
      <div class="exec-highlight-box exec-working">
        <h3>What's Working Well</h3>
        <ul><li>Strength item</li></ul>
      </div>
      <div class="exec-highlight-box exec-opportunity-box">
        <h3>Where There's Opportunity</h3>
        <ul><li>Opportunity item</li></ul>
      </div>
    </div>

    <div class="exec-opps">
      <div class="exec-opp-item">
        <span class="exec-opp-num">1</span>
        <h4>Opportunity Title</h4>
        <p>Description</p>
      </div>
    </div>

    <div class="exec-callout">
      <h3>Biggest Opportunity</h3>
      <p>Summary callout text</p>
    </div>
  </div>
</section>
```

**Status Badges** — for platform/channel presence checks:
```html
<div class="status-row">
  <span class="status-badge status-active">● Active</span>
  <!-- or status-warning for partial, status-inactive for missing -->
  <strong>Platform Name</strong> — Description
</div>
```

**Opportunity Cards** — for improvement recommendations:
```html
<div class="opp-card">
  <h4>Card Title</h4>
  <p>Description of the opportunity.</p>
  <ul>
    <li>Action item one</li>
    <li>Action item two</li>
  </ul>
</div>
```

**Competitor Table** — for competitive landscape:
```html
<table class="comp-table">
  <thead><tr><th>Competitor</th><th>Key Strength</th></tr></thead>
  <tbody>
    <tr><td><strong>Name</strong></td><td>Description</td></tr>
  </tbody>
</table>
```

**SWOT Grid** — 2x2 color-coded grid:
```html
<div class="swot-grid">
  <div class="swot-card swot-strengths"><h4>Strengths</h4><ul>...</ul></div>
  <div class="swot-card swot-weaknesses"><h4>Weaknesses</h4><ul>...</ul></div>
  <div class="swot-card swot-opportunities"><h4>Opportunities</h4><ul>...</ul></div>
  <div class="swot-card swot-threats"><h4>Threats</h4><ul>...</ul></div>
</div>
```

**Priority Cards** — for ranked strategic recommendations:
```html
<div class="priority-card">
  <span class="priority-number">01</span>
  <h4>Recommendation Title</h4>
  <ul>
    <li>Action item</li>
  </ul>
</div>
```

### 5. CTA Configuration

All "Let's Chat" buttons are simple mailto links. The subject line includes the brand name:

```html
<a href="mailto:jake@getmrkt.com?subject=Brand%20Audit%20Follow-up%20%E2%80%94%20BRAND_NAME" class="btn btn-gold">Let's Chat</a>
```

URL-encode the brand name in the subject. Use `%20` for spaces, `%E2%80%94` for em dash.

Three CTA placements per page:
1. Sticky bar — `btn btn-gold` (always visible)
2. Verdict section — `btn btn-gold` with larger padding
3. Bottom CTA section — `btn btn-navy` with larger padding

### 6. Loom Video Embed

If a Loom URL is provided:
```html
<div class="video-embed">
  <iframe src="https://www.loom.com/embed/VIDEO_ID" allowfullscreen></iframe>
</div>
```

If no Loom URL, use the placeholder:
```html
<div class="video-embed">
  <div class="video-placeholder">
    <svg viewBox="0 0 24 24"><path d="M8 5v14l11-7z"/></svg>
    <span>Loom video will appear here</span>
  </div>
</div>
```

### 7. Section Numbering

Each audit section gets a number label:
```html
<div class="section-number">Section 01</div>
```

Sections alternate backgrounds automatically via CSS nth-child (white/light gray).

### 8. Adapting Content

The raw audit content may not follow an exact structure. Map it intelligently:

* Platform/channel checks → Status badges (green/yellow/red)
* Website feedback or improvement areas → Opportunity cards
* Competitor lists → Competitor table
* Competitor analysis paragraphs → h3 subheadings within a section
* Strengths/weaknesses/opportunities/threats → SWOT grid
* Prioritized recommendations → Priority cards (numbered)
* Summary/verdict → Verdict section

If the raw content has sections not covered by these components, use standard `<h3>` headings and `<p>` paragraphs within an audit-section.

## Deployment

```bash
# Deploy to production
vercel --prod

# URL format
# review.getmrkt.com/{brand-slug}
```

## Important Notes

* Every page is fully self-contained — all CSS is inline in the `<style>` tag, no external stylesheets besides Google Fonts
* No JavaScript needed — the page is pure HTML/CSS with mailto links
* Always use the complete CSS block from the reference template — do not abbreviate or skip styles
* Test responsiveness — the template handles mobile via a `@media (max-width: 640px)` block
* The `template/reference.html` file is the Hairprint audit — use it as the source of truth for all styling
