# Fleet Flow

A static car rental site built with Hugo and the Hugoplate theme.

Live: https://7nolikov.dev/fleet-flow/

## Background

I work in backend / distributed systems (Go, Java). This was a weekend project to see how far Hugo plus a polished theme can carry a real-looking business site — an exercise in shipping a frontend-heavy stack (Hugo, TailwindCSS, theme-as-module, Cal.com booking stubs) end-to-end without writing custom JavaScript. AI assistance handled most of the Hugo templating idioms I didn't want to memorise.

Not a real business. A working, deployed sandbox.

## What it has

- Fleet catalog with filtering by transmission, body type, fuel type
- Individual car pages with specs
- Cal.com integration stubs for booking
- Responsive TailwindCSS layout

## Stack

- Hugo Extended (Hugoplate as a Hugo Module)
- TailwindCSS
- Cal.com booking integration

## Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) v0.128+
- [Go](https://go.dev/dl/) 1.21+
- [Node.js](https://nodejs.org/) 18+

## Local development

```bash
git clone https://github.com/7nolikov/fleet-flow.git
cd fleet-flow
npm install
hugo mod get -u
make dev
```

Visit `http://localhost:1313`.

## Commands

| Command                  | What it does                  |
| ------------------------ | ----------------------------- |
| `make dev`               | Dev server, drafts enabled    |
| `make build`             | Production build              |
| `make clean`             | Remove generated files        |
| `make new-car name=slug` | Scaffold a new car entry      |
| `make install`           | Install all dependencies      |
| `make check`             | Verify tool versions          |

## Adding a car

```bash
make new-car name=bmw-x5-2024
```

Then fill in `content/cars/bmw-x5-2024.md`. Schema (relevant fields):

```yaml
---
title: "Brand Model Year"
make: "Brand"
model: "Model"
year: 2024
transmissions: ["automatic"]      # automatic, manual
body_types: ["sedan"]             # sedan, suv, coupe, hatchback, van, convertible
fuel_types: ["petrol"]            # petrol, diesel, hybrid, electric
seats: 5
price_per_day: 50
currency: "EUR"
cal_link: "https://cal.com/autorent/car-slug"
available: true
featured_image: "/images/cars/car-photo.jpg"
features: ["Feature 1", "Feature 2"]
description: "Brief description."
---
```

## Taxonomy URLs

- `/transmissions/{automatic,manual}/`
- `/body_types/{sedan,suv,...}/`
- `/fuel_types/{petrol,diesel,hybrid,electric}/`

## License

MIT — see [LICENSE](LICENSE).
