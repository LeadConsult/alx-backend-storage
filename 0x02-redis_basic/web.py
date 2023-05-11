#!/usr/bin/env python3
"""
request caching and tracking.
"""
import redis
import requests
from datetime import timedelta


def get_page(url: str) -> str:
    """this function allows for caching the response of
    URL requests using Redis, reducing the need to make
    redundant requests and improving performance by
    retrieving the cached response when available. It also
    tracks the number of requests made to each URL using Redis.
    """
    if url is None or len(url.strip()) == 0:
        return ''
    redis_store = redis.Redis()
    storing_result_key = 'result:{}'.format(url)
    tracking_request_count_key = 'count:{}'.format(url)
    result = redis_store.get(storing_result_key)
    if result is not None:
        redis_store.incr(tracking_request_count_key)
        return result
    result = requests.get(url).content.decode('utf-8')
    redis_store.setex(storing_result_key, timedelta(seconds=10), result)
    return result