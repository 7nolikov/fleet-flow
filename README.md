# AutoRent - Fleet Flow

A modern car rental platform built with Hugo and the Hugoplate theme.

## Overview

AutoRent is a static website for a car rental business, featuring:
- Fleet catalog with filtering by transmission, body type, and fuel type
- Individual car detail pages with specifications and booking links
- Integration-ready for Cal.com booking system
- Responsive design with TailwindCSS

## Tech Stack

- **Static Site Generator:** Hugo (Extended)
- **Theme:** Hugoplate (as Hugo Module)
- **Styling:** TailwindCSS
- **Booking:** Cal.com integration ready

## Prerequisites

- [Hugo Extended](https://gohugo.io/installation/) v0.128+
- [Go](https://go.dev/dl/) 1.21+
- [Node.js](https://nodejs.org/) 18+

## Quick Start

```powershell
# Clone the repository
git clone https://github.com/dmitrii-novikov/fleet-flow.git
cd fleet-flow

# Install dependencies
npm install
hugo mod get -u

# Start development server
make dev
# Or: hugo server -D --bind 0.0.0.0
```

Visit `http://localhost:1313` to see the site.

## Project Structure

```
fleet-flow/
├── archetypes/          # Content templates
│   └── cars.md          # Car entry template
├── config/_default/     # Hugo configuration
│   ├── hugo.toml        # Main config
│   ├── menus.toml       # Navigation
│   ├── params.toml      # Site parameters
│   └── module.toml      # Hugoplate module
├── content/
│   └── cars/            # Car listings
├── layouts/
│   ├── cars/            # Car-specific layouts
│   │   ├── list.html    # Fleet grid
│   │   └── single.html  # Car detail page
│   └── _default/        # Taxonomy layouts
├── static/images/cars/  # Car photos
└── Makefile             # Build commands
```

## Adding a New Car

```powershell
# Using the Makefile
make new-car name=bmw-x5-2024

# Or manually
hugo new cars/bmw-x5-2024.md
```

Then edit the generated file in `content/cars/bmw-x5-2024.md` with the car details.

## Car Frontmatter Schema

```yaml
---
title: "Brand Model Year"
make: "Brand"
model: "Model Name"
year: 2024
# Taxonomies (must be arrays for Hugo filtering)
transmissions:                # automatic, manual
  - "automatic"
body_types:                   # sedan, suv, coupe, hatchback, van, convertible
  - "sedan"
fuel_types:                   # petrol, diesel, hybrid, electric
  - "petrol"
# Specs
seats: 5
doors: 4
color: "Color Name"
engine: "2.0L Turbo"
horsepower: 200
mileage: "15,000 km"
# Pricing
price_per_day: 50
currency: "EUR"
deposit: 200
# Booking
cal_link: "https://cal.com/autorent/car-slug"
available: true
# Media
featured_image: "/images/cars/car-photo.jpg"
images:
  - "/images/cars/car-photo-1.jpg"
  - "/images/cars/car-photo-2.jpg"
# Content
features:
  - "Feature 1"
  - "Feature 2"
description: "Brief description of the vehicle."
---
```

## Commands

| Command | Description |
|---------|-------------|
| `make dev` | Start dev server with drafts |
| `make build` | Build production site |
| `make clean` | Remove generated files |
| `make new-car name=slug` | Create new car entry |
| `make install` | Install all dependencies |
| `make check` | Verify tool versions |

## Taxonomies (Filters)

Cars can be filtered by:
- `/transmissions/automatic/` - Automatic transmission
- `/transmissions/manual/` - Manual transmission
- `/body_types/sedan/` - Sedans
- `/body_types/suv/` - SUVs
- `/fuel_types/electric/` - Electric vehicles
- `/fuel_types/hybrid/` - Hybrid vehicles

## Development Roadmap

### Stage 1: Static Showroom (Current)
- [x] Hugo site with Hugoplate theme
- [x] Cars content type with frontmatter
- [x] List and single layouts
- [x] Taxonomy-based filtering
- [ ] Image optimization

### Stage 2: Low-Code Automation
- [ ] Cal.com embed integration
- [ ] n8n webhook workflows
- [ ] Stripe payment links

### Stage 3: Full Backend
- [ ] Go microservice for availability
- [ ] Real-time inventory management
- [ ] Double-booking prevention

## License

MIT License - see [LICENSE](LICENSE) for details.
