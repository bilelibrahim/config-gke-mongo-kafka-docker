#!/usr/bin/env python3
#
# author: bilel ibrahim
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Create sample data by hitting Storefront sample endpoints
#          Update storefront_api_url and jwt
# usage: python3 ./refresh.py

import requests
import time


def main():
    create_sample_data()


def create_sample_data():
    storefront_api_url = 'http://34.89.121.193'
    sample_urls = [
        'accounts/actuator/health',
        'orders/actuator/health',
        'fulfillment/actuator/health',
        'accounts/customers/sample',
        'orders/customers/sample/orders',
        'orders/customers/sample/fulfill',
        'fulfillment/fulfillments/sample/process',
        'fulfillment/fulfillments/sample/ship',
        'fulfillment/fulfillments/sample/in-transit',
        'fulfillment/fulfillments/sample/receive']

    for sample_url in sample_urls:
        request_endpoint = storefront_api_url + '/' + sample_url
        r = requests.get(request_endpoint)

        print(request_endpoint + '\n' + r.text + '\n' + '---')
        time.sleep(3)


if __name__ == "__main__":
    main()
