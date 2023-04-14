# Tea Subscription

## Table of Contents

- [Description](#description)
- [Technical Details](#technical-details)
- [Getting Started](#getting-started)
  - [Local Installation](#local-installation)
  - [Endpoints](#endpoints)
  - [RSpec Suite](#rspec-suite)
- [Schema](#schema)
- [Authors \& Acknowledgments](#authors--acknowledgments)

## Description

Tea Subscription is a backend API service which simulates endpoints for a tea subscription service.  It was created to satisfy the requirements for a Mod 4 take-home project at the [Turing School of Software and Design](https://turing.edu/).  Project requirements can be found [here](https://mod4.turing.edu/projects/take_home/take_home_be).

## Technical Details

This application is built with Ruby on Rails and tested with RSpec.  API endpoint data is returned in json.

## Getting Started

### Local Installation

1. Clone the repo

```
git clone git@github.com:dlayton66/tea_subscription.git
```

2. Install gems
```
bundle install
```

3. Create database and run migrations
```
rails db:{create,migrate}
```

4. Run rails server
```
rails server
```

5. Call the [endpoints](#endpoints) from your favorite API platform (e.g. [Postman](https://www.postman.com/))

### Endpoints

1. Create customer subscription
```
POST http://localhost:3000/api/v1/customers/:customer_id/subscriptions

Example params:
{
  tea_id: 1,
  price: 10.00,
  frequency: 14
}
```

2. Get customer subscriptions
```
GET http://localhost:3000/api/v1/customers/:customer_id/subscriptions

Example response:
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "price": "15.0",
                "frequency": 7,
                "status": "cancelled",
                "tea": "Black"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "price": "8.0",
                "frequency": 14,
                "status": "cancelled",
                "tea": "Green"
            }
        }
    ]
}
```

3. Cancel customer subscription
```
PATCH http://localhost:3000/api/v1/customers/:customer_id/subscriptions/:subscription_id?status=cancelled
```

### RSpec Suite

Run the entire spec suite

```
bundle exec rspec
```

All tests should be passing.

## Schema
![Screenshot 2023-04-13 at 9 14 20 PM](https://user-images.githubusercontent.com/113313770/231932468-938ca29c-1eea-4c4d-9d93-d2098000005c.png)

## Authors & Acknowledgments

:bust_in_silhouette: **Drew Layton** 
- dlayton66@gmail.com
- [GitHub](https://github.com/dlayton66)
- [LinkedIn](https://www.linkedin.com/in/drew-layton/)
