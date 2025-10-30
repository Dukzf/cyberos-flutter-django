"""Utilities for geocoding addresses using OpenStreetMap Nominatim.
This module attempts to use `requests` and falls back to urllib if requests is unavailable.
"""
from urllib.parse import urlencode
import json

DEFAULT_USER_AGENT = 'CyberOS/1.0 (+https://example.com)'


def geocode_address(address, user_agent=DEFAULT_USER_AGENT, timeout=5):
    """Geocode an address string using Nominatim and return (lat, lon) as floats or None on failure.

    Note: This performs a network request to OpenStreetMap's Nominatim service.
    Use responsibly and consider adding server-side caching for production.
    """
    if not address:
        return None

    params = {'q': address, 'format': 'json', 'limit': 1}
    url = 'https://nominatim.openstreetmap.org/search?' + urlencode(params)

    # Try requests if available
    try:
        import requests
        headers = {'User-Agent': user_agent}
        resp = requests.get(url, headers=headers, timeout=timeout)
        if resp.status_code != 200:
            return None
        results = resp.json()
    except Exception:
        # Fallback to urllib
        try:
            from urllib.request import Request, urlopen
            req = Request(url, headers={'User-Agent': user_agent})
            with urlopen(req, timeout=timeout) as f:
                body = f.read().decode('utf-8')
                results = json.loads(body)
        except Exception:
            return None

    if not results:
        return None

    try:
        lat = float(results[0].get('lat'))
        lon = float(results[0].get('lon'))
        return (lat, lon)
    except Exception:
        return None


def geocode_address_variants(address=None, cep=None, cidade=None, estado=None, country='Brasil', user_agent=DEFAULT_USER_AGENT, timeout=5, pause_between=0.5):
    """Try multiple variants of an address to improve geocoding success.

    Strategy (first-success):
    - raw address
    - raw + ", Brasil"
    - raw + ", {cidade} {estado}"
    - raw + ", {cidade} {estado}, Brasil"
    - cep only (if provided)
    - cidade + cep + country
    Returns (lat, lon) or None.
    """
    import time
    if not address and not cep and not cidade:
        return None

    candidates = []
    # normalize
    addr = (address or '').strip()
    if addr:
        candidates.append(addr)
        candidates.append(f"{addr}, {country}")
        if cidade and estado:
            candidates.append(f"{addr}, {cidade} {estado}")
            candidates.append(f"{addr}, {cidade} {estado}, {country}")
    # CEP-based queries
    if cep:
        cep_clean = ''.join(ch for ch in cep if ch.isdigit())
        if cep_clean:
            candidates.append(cep_clean)
            candidates.append(f"{cidade or ''} {estado or ''} {cep_clean} {country}".strip())

    # City-level fallback
    if cidade and estado:
        candidates.append(f"{cidade} {estado}, {country}")
        candidates.append(f"{cidade} {estado}")

    # Deduplicate while preserving order
    seen = set()
    queries = []
    for c in candidates:
        s = ' '.join(c.split())
        if s and s not in seen:
            seen.add(s)
            queries.append(s)

    # Try each query with small pause and short retry
    for q in queries:
        try:
            res = geocode_address(q, user_agent=user_agent, timeout=timeout)
            if res:
                return res
        except Exception:
            pass
        time.sleep(pause_between)

    return None
