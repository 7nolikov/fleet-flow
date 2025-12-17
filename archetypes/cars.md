---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: false

# Vehicle Details
make: ""
model: ""
year: {{ now.Year }}
transmissions:               # taxonomy: automatic, manual
  - "automatic"
body_types:                  # taxonomy: sedan, suv, hatchback, van, coupe, convertible
  - "sedan"
fuel_types:                  # taxonomy: petrol, diesel, hybrid, electric
  - "petrol"
seats: 5
doors: 4
color: ""
engine: ""
horsepower: 0
mileage: ""

# Pricing
price_per_day: 0
currency: "EUR"
deposit: 0

# Booking
cal_link: ""
available: true

# Media
images: []
featured_image: ""

# Description
description: ""
features: []
---

Write a compelling description of the vehicle here. Highlight its key features, comfort, and driving experience.

